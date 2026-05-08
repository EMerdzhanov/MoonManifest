import 'dart:math';

import 'package:moon_manifest/core/moon/moon_constants.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';

/// Moon phase engine implementing Jean Meeus' algorithm from
/// "Astronomical Algorithms" Chapter 49.
///
/// All computation is done in UTC. Accuracy is within a few hours
/// for the range 2020-2030.
class MoonPhaseEngine {
  /// Set this to override [now] for testing purposes.
  DateTime? debugDateOverride;

  /// Returns [debugDateOverride] if set, otherwise [DateTime.now] in UTC.
  DateTime get now => debugDateOverride ?? DateTime.now().toUtc();

  static const double _deg2rad = pi / 180.0;

  // ── Public API ──────────────────────────────────────────────────────

  /// Returns full phase info for the given [dateTime].
  MoonPhaseInfo currentPhase(DateTime dateTime) {
    final dt = dateTime.toUtc();

    final prevNew = _previousNewMoon(dt);
    // For illumination and phase logic, we need the next new moon
    // strictly AFTER the previous one (not the same one).
    final nextNew = _nextNewMoonAfter(prevNew);
    final prevFull = _previousFullMoon(dt);
    final nextFull = _nextFullMoonAfter(prevFull);

    final phase = _determinePhase(dt, prevNew, nextNew, prevFull, nextFull);
    final gracePeriod = _isInGracePeriod(dt, phase, prevNew, prevFull);
    final deadline = _graceDeadline(phase, prevNew, prevFull);
    final boundaries = _phaseBoundaries(
        dt, phase, prevNew, nextNew, prevFull, nextFull);
    final illum = _approximateIllumination(dt, prevNew, nextNew);

    final phaseStart = boundaries.$1;
    final phaseEnd = boundaries.$2;
    final dayInPhase =
        dt.difference(phaseStart).inHours ~/ 24 + 1;
    final totalDaysInPhase =
        phaseEnd.difference(phaseStart).inHours ~/ 24;

    return MoonPhaseInfo(
      phase: phase,
      phaseStart: phaseStart,
      phaseEnd: phaseEnd,
      dayInPhase: dayInPhase,
      totalDaysInPhase: totalDaysInPhase > 0 ? totalDaysInPhase : 1,
      isGracePeriod: gracePeriod,
      graceDeadline: gracePeriod ? deadline : null,
      nextNewMoon: nextNew,
      nextFullMoon: nextFull,
      illumination: illum.clamp(0.0, 1.0),
    );
  }

  /// Alias for [currentPhase].
  MoonPhaseInfo phaseAtDate(DateTime date) => currentPhase(date);

  /// Computes the next new moon on or after [from].
  DateTime nextNewMoon(DateTime from) {
    final dt = from.toUtc();
    final year = _dateToYear(dt);
    var k = ((year - 2000) * 12.3685).floorToDouble();

    // Search forward
    for (var i = 0; i < 15; i++) {
      final jde = _computeNewMoonJDE(k);
      final moonDate = _jdeToDateTime(jde);
      if (!moonDate.isBefore(dt.subtract(const Duration(hours: 1)))) {
        return moonDate;
      }
      k += 1;
    }
    // Fallback (should not happen)
    return _jdeToDateTime(_computeNewMoonJDE(k));
  }

  /// Computes the next full moon on or after [from].
  DateTime nextFullMoon(DateTime from) {
    final dt = from.toUtc();
    final year = _dateToYear(dt);
    var k = ((year - 2000) * 12.3685).floorToDouble() + 0.5;

    for (var i = 0; i < 15; i++) {
      final jde = _computeFullMoonJDE(k);
      final moonDate = _jdeToDateTime(jde);
      if (!moonDate.isBefore(dt.subtract(const Duration(hours: 1)))) {
        return moonDate;
      }
      k += 1;
    }
    return _jdeToDateTime(_computeFullMoonJDE(k));
  }

  /// Next new moon strictly after [ref] (at least 1 day later).
  DateTime _nextNewMoonAfter(DateTime ref) {
    return nextNewMoon(ref.add(const Duration(days: 1)));
  }

  /// Next full moon strictly after [ref] (at least 1 day later).
  DateTime _nextFullMoonAfter(DateTime ref) {
    return nextFullMoon(ref.add(const Duration(days: 1)));
  }

  // ── Internal: previous moons ───────────────────────────────────────

  DateTime _previousNewMoon(DateTime dt) {
    final year = _dateToYear(dt);
    var k = ((year - 2000) * 12.3685).ceilToDouble();

    for (var i = 0; i < 15; i++) {
      final jde = _computeNewMoonJDE(k);
      final moonDate = _jdeToDateTime(jde);
      if (moonDate.isBefore(dt.add(const Duration(hours: 1)))) {
        return moonDate;
      }
      k -= 1;
    }
    return _jdeToDateTime(_computeNewMoonJDE(k));
  }

  DateTime _previousFullMoon(DateTime dt) {
    final year = _dateToYear(dt);
    var k = ((year - 2000) * 12.3685).ceilToDouble() + 0.5;

    for (var i = 0; i < 15; i++) {
      final jde = _computeFullMoonJDE(k);
      final moonDate = _jdeToDateTime(jde);
      if (moonDate.isBefore(dt.add(const Duration(hours: 1)))) {
        return moonDate;
      }
      k -= 1;
    }
    return _jdeToDateTime(_computeFullMoonJDE(k));
  }

  // ── Phase determination ────────────────────────────────────────────

  MoonPhase _determinePhase(
    DateTime dt,
    DateTime prevNew,
    DateTime nextNew,
    DateTime prevFull,
    DateTime nextFull,
  ) {
    final totalWindow = MoonConstants.totalRitualWindow;
    final halfActive = MoonConstants.halfActiveWindow;

    // Check new moon window
    final sincePrevNew = dt.difference(prevNew);
    final untilNextNew = nextNew.difference(dt);
    if (sincePrevNew >= Duration.zero && sincePrevNew < totalWindow) {
      return MoonPhase.newMoon;
    }
    if (untilNextNew >= Duration.zero && untilNextNew < halfActive) {
      return MoonPhase.newMoon;
    }

    // Check full moon window
    final sincePrevFull = dt.difference(prevFull);
    final untilNextFull = nextFull.difference(dt);
    if (sincePrevFull >= Duration.zero && sincePrevFull < totalWindow) {
      return MoonPhase.fullMoon;
    }
    if (untilNextFull >= Duration.zero && untilNextFull < halfActive) {
      return MoonPhase.fullMoon;
    }

    // Waxing or waning based on which is more recent
    if (prevNew.isAfter(prevFull)) {
      return MoonPhase.waxing;
    } else {
      return MoonPhase.waning;
    }
  }

  bool _isInGracePeriod(
    DateTime dt,
    MoonPhase phase,
    DateTime prevNew,
    DateTime prevFull,
  ) {
    final halfActive = MoonConstants.halfActiveWindow;
    final totalWindow = MoonConstants.totalRitualWindow;

    if (phase == MoonPhase.newMoon) {
      final since = dt.difference(prevNew);
      return since > halfActive && since < totalWindow;
    }
    if (phase == MoonPhase.fullMoon) {
      final since = dt.difference(prevFull);
      return since > halfActive && since < totalWindow;
    }
    return false;
  }

  DateTime? _graceDeadline(
    MoonPhase phase,
    DateTime prevNew,
    DateTime prevFull,
  ) {
    final totalWindow = MoonConstants.totalRitualWindow;
    if (phase == MoonPhase.newMoon) {
      return prevNew.add(totalWindow);
    }
    if (phase == MoonPhase.fullMoon) {
      return prevFull.add(totalWindow);
    }
    return null;
  }

  (DateTime, DateTime) _phaseBoundaries(
    DateTime dt,
    MoonPhase phase,
    DateTime prevNew,
    DateTime nextNew,
    DateTime prevFull,
    DateTime nextFull,
  ) {
    final totalWindow = MoonConstants.totalRitualWindow;
    final halfActive = MoonConstants.halfActiveWindow;

    switch (phase) {
      case MoonPhase.newMoon:
        final since = dt.difference(prevNew);
        if (since >= Duration.zero && since < totalWindow) {
          return (
            prevNew.subtract(halfActive),
            prevNew.add(totalWindow),
          );
        }
        // Approaching next new moon
        return (
          nextNew.subtract(halfActive),
          nextNew.add(totalWindow),
        );

      case MoonPhase.fullMoon:
        final since = dt.difference(prevFull);
        if (since >= Duration.zero && since < totalWindow) {
          return (
            prevFull.subtract(halfActive),
            prevFull.add(totalWindow),
          );
        }
        return (
          nextFull.subtract(halfActive),
          nextFull.add(totalWindow),
        );

      case MoonPhase.waxing:
        // From end of new moon window to start of full moon window
        final start = prevNew.add(totalWindow);
        final end = nextFull.subtract(halfActive);
        return (start, end);

      case MoonPhase.waning:
        // From end of full moon window to start of new moon window
        final start = prevFull.add(totalWindow);
        final end = nextNew.subtract(halfActive);
        return (start, end);
    }
  }

  double _approximateIllumination(
    DateTime dt,
    DateTime prevNew,
    DateTime nextNew,
  ) {
    // Cosine approximation based on position in synodic month
    final totalDuration = nextNew.difference(prevNew).inSeconds.toDouble();
    if (totalDuration <= 0) return 0.5;
    final elapsed = dt.difference(prevNew).inSeconds.toDouble();
    final fraction = elapsed / totalDuration;
    // illumination = 0 at new moon, 1 at full moon (mid-cycle), 0 again
    return (1 - cos(2 * pi * fraction)) / 2;
  }

  // ── Jean Meeus Algorithm (Chapter 49) ──────────────────────────────

  double _computeNewMoonJDE(double k) {
    // k must be an integer for new moon
    final kInt = k.roundToDouble();
    return _computeMoonPhaseJDE(kInt, isFullMoon: false);
  }

  double _computeFullMoonJDE(double k) {
    // k must be integer + 0.5 for full moon
    final kHalf = k.floorToDouble() + 0.5;
    return _computeMoonPhaseJDE(kHalf, isFullMoon: true);
  }

  double _computeMoonPhaseJDE(double k, {required bool isFullMoon}) {
    final T = k / 1236.85;
    final T2 = T * T;
    final T3 = T2 * T;
    final T4 = T3 * T;

    // Mean JDE
    var jde = 2451550.09766 +
        29.530588861 * k +
        0.00015437 * T2 -
        0.000000150 * T3 +
        0.00000000073 * T4;

    // Eccentricity correction
    final E = 1 - 0.002516 * T - 0.0000074 * T2;
    final E2 = E * E;

    // Sun's mean anomaly
    final M = _normalizeDeg(2.5534 +
        29.10535670 * k -
        0.0000014 * T2 -
        0.00000011 * T3);

    // Moon's mean anomaly
    final Mp = _normalizeDeg(201.5643 +
        385.81693528 * k +
        0.0107582 * T2 +
        0.00001238 * T3 -
        0.000000058 * T4);

    // Moon's argument of latitude
    final F = _normalizeDeg(160.7108 +
        390.67050284 * k -
        0.0016118 * T2 -
        0.00000227 * T3 +
        0.000000011 * T4);

    // Longitude of ascending node
    final omega = _normalizeDeg(124.7746 -
        1.56375588 * k +
        0.0020672 * T2 +
        0.00000215 * T3);

    // Convert to radians
    final mRad = M * _deg2rad;
    final mpRad = Mp * _deg2rad;
    final fRad = F * _deg2rad;
    final omegaRad = omega * _deg2rad;

    double correction;
    if (!isFullMoon) {
      // New moon corrections
      correction = -0.40720 * sin(mpRad) +
          0.17241 * E * sin(mRad) +
          0.01608 * sin(2 * mpRad) +
          0.01039 * sin(2 * fRad) +
          0.00739 * E * sin(mpRad - mRad) -
          0.00514 * E * sin(mpRad + mRad) +
          0.00208 * E2 * sin(2 * mRad) -
          0.00111 * sin(mpRad - 2 * fRad) -
          0.00057 * sin(mpRad + 2 * fRad) +
          0.00056 * E * sin(2 * mpRad + mRad) -
          0.00042 * sin(3 * mpRad) +
          0.00042 * E * sin(mRad + 2 * fRad) +
          0.00038 * E * sin(mRad - 2 * fRad) -
          0.00024 * E * sin(2 * mpRad - mRad) -
          0.00017 * sin(omegaRad) -
          0.00007 * sin(mpRad + 2 * mRad) +
          0.00004 * sin(2 * mpRad - 2 * fRad) +
          0.00004 * sin(3 * mRad) +
          0.00003 * sin(mpRad + mRad - 2 * fRad) +
          0.00003 * sin(2 * mpRad + 2 * fRad) -
          0.00003 * sin(mpRad + mRad + 2 * fRad) +
          0.00003 * sin(mpRad - mRad + 2 * fRad) -
          0.00002 * sin(mpRad - mRad - 2 * fRad) -
          0.00002 * sin(3 * mpRad + mRad) +
          0.00002 * sin(4 * mpRad);
    } else {
      // Full moon corrections
      correction = -0.40614 * sin(mpRad) +
          0.17302 * E * sin(mRad) +
          0.01614 * sin(2 * mpRad) +
          0.01043 * sin(2 * fRad) +
          0.00734 * E * sin(mpRad - mRad) -
          0.00515 * E * sin(mpRad + mRad) +
          0.00209 * E2 * sin(2 * mRad) -
          0.00111 * sin(mpRad - 2 * fRad) -
          0.00057 * sin(mpRad + 2 * fRad) +
          0.00056 * E * sin(2 * mpRad + mRad) -
          0.00042 * sin(3 * mpRad) +
          0.00042 * E * sin(mRad + 2 * fRad) +
          0.00038 * E * sin(mRad - 2 * fRad) -
          0.00024 * E * sin(2 * mpRad - mRad) -
          0.00017 * sin(omegaRad) -
          0.00007 * sin(mpRad + 2 * mRad) +
          0.00004 * sin(2 * mpRad - 2 * fRad) +
          0.00004 * sin(3 * mRad) +
          0.00003 * sin(mpRad + mRad - 2 * fRad) +
          0.00003 * sin(2 * mpRad + 2 * fRad) -
          0.00003 * sin(mpRad + mRad + 2 * fRad) +
          0.00003 * sin(mpRad - mRad + 2 * fRad) -
          0.00002 * sin(mpRad - mRad - 2 * fRad) -
          0.00002 * sin(3 * mpRad + mRad) +
          0.00002 * sin(4 * mpRad);
    }

    jde += correction;

    // Planetary arguments A1-A14
    final a1 = _normalizeDeg(299.77 + 132.8475848 * k - 0.009173 * T2);
    final a2 = _normalizeDeg(251.88 + 92.517 * k);
    final a3 = _normalizeDeg(251.83 + 360.00758634 * k);
    final a4 = _normalizeDeg(349.42 + 450.37046 * k);
    final a5 = _normalizeDeg(84.66 + 966.2 * k);
    final a6 = _normalizeDeg(141.74 + 1413.68 * k);
    final a7 = _normalizeDeg(207.14 + 35.89 * k);
    final a8 = _normalizeDeg(154.84 + 19.321 * k);
    final a9 = _normalizeDeg(34.52 + 27.261 * k);
    final a10 = _normalizeDeg(207.19 + 4.694 * k);
    final a11 = _normalizeDeg(291.34 + 0.967 * k);
    final a12 = _normalizeDeg(161.72 + 1.629 * k);
    final a13 = _normalizeDeg(239.56 + 25.513 * k);
    final a14 = _normalizeDeg(331.55 + 13.170 * k);

    final additionalCorrection = 0.000325 * sin(a1 * _deg2rad) +
        0.000165 * sin(a2 * _deg2rad) +
        0.000164 * sin(a3 * _deg2rad) +
        0.000126 * sin(a4 * _deg2rad) +
        0.000110 * sin(a5 * _deg2rad) +
        0.000062 * sin(a6 * _deg2rad) +
        0.000060 * sin(a7 * _deg2rad) +
        0.000056 * sin(a8 * _deg2rad) +
        0.000047 * sin(a9 * _deg2rad) +
        0.000042 * sin(a10 * _deg2rad) +
        0.000040 * sin(a11 * _deg2rad) +
        0.000037 * sin(a12 * _deg2rad) +
        0.000035 * sin(a13 * _deg2rad) +
        0.000023 * sin(a14 * _deg2rad);

    jde += additionalCorrection;

    return jde;
  }

  // ── Utility methods ────────────────────────────────────────────────

  /// Normalize angle to [0, 360) degrees.
  double _normalizeDeg(double deg) {
    var result = deg % 360;
    if (result < 0) result += 360;
    return result;
  }

  /// Convert a fractional year representation of a DateTime.
  double _dateToYear(DateTime dt) {
    final start = DateTime.utc(dt.year);
    final end = DateTime.utc(dt.year + 1);
    return dt.year +
        dt.difference(start).inMilliseconds /
            end.difference(start).inMilliseconds;
  }

  /// Convert Julian Ephemeris Day to DateTime (UTC).
  DateTime _jdeToDateTime(double jde) {
    final z = (jde + 0.5).floor();
    final f = jde + 0.5 - z;

    int a;
    if (z >= 2299161) {
      final alpha = ((z - 1867216.25) / 36524.25).floor();
      a = z + 1 + alpha - (alpha ~/ 4);
    } else {
      a = z;
    }

    final b = a + 1524;
    final c = ((b - 122.1) / 365.25).floor();
    final d = (365.25 * c).floor();
    final e = ((b - d) / 30.6001).floor();

    final dayFrac = b - d - (30.6001 * e).floor() + f;
    final day = dayFrac.floor();
    final fracOfDay = dayFrac - day;

    final month = e < 14 ? e - 1 : e - 13;
    final year = month > 2 ? c - 4716 : c - 4715;

    final totalSeconds = (fracOfDay * 86400).round();
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    return DateTime.utc(year, month, day, hours, minutes, seconds);
  }
}

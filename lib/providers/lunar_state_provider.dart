import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/moon/moon_phase_engine.dart';
import 'package:moon_manifest/core/notifications/notification_scheduler.dart';
import 'package:moon_manifest/data/models/lunar_state.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/settings_provider.dart';

final moonPhaseEngineProvider = Provider<MoonPhaseEngine>((ref) {
  return MoonPhaseEngine();
});

final lunarStateProvider = AsyncNotifierProvider<LunarStateNotifier, LunarState>(LunarStateNotifier.new);

class LunarStateNotifier extends AsyncNotifier<LunarState> {
  Timer? _refreshTimer;

  @override
  Future<LunarState> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    _refreshTimer = Timer.periodic(const Duration(seconds: 60), (_) => _refresh());
    return _computeState();
  }

  Future<LunarState> _computeState() async {
    final engine = ref.read(moonPhaseEngineProvider);
    final now = engine.now;
    final phaseInfo = engine.currentPhase(now);

    // Get mutable cycle reference
    var cycle = await ref.read(activeCycleProvider.future);

    // Check if we need to transition cycles
    if (cycle != null && phaseInfo.phase == MoonPhase.newMoon) {
      final cycleNewMoon = cycle.newMoonDate;
      final currentNewMoon = phaseInfo.phaseStart;
      final daysBetween = currentNewMoon.difference(cycleNewMoon).inDays;
      if (daysBetween > 20) {
        // This is a different new moon — complete the old cycle
        await ref.read(activeCycleProvider.notifier).completeCycle();
        cycle = null;
      }
    }

    final lunarState = LunarState(
      phase: phaseInfo.phase,
      dayInPhase: phaseInfo.dayInPhase,
      totalDaysInPhase: phaseInfo.totalDaysInPhase,
      isGracePeriod: phaseInfo.isGracePeriod,
      graceDeadline: phaseInfo.graceDeadline,
      activeCycle: cycle,
      nextNewMoon: phaseInfo.nextNewMoon,
      nextFullMoon: phaseInfo.nextFullMoon,
      illumination: phaseInfo.illumination,
    );

    final settings = ref.read(settingsProvider);
    final intentions = cycle?.intentions.map((i) => i.text).toList() ?? [];
    final (startH, startM) = settings.wakeStart;
    final (endH, endM) = settings.wakeEnd;

    // TODO: Re-enable when running on a real device.
    // Notification scheduling is disabled during development because
    // it can cause native-level crashes in the iOS simulator.
    // try {
    //   await NotificationScheduler.reschedule(
    //     phase: phaseInfo.phase,
    //     intentions: intentions,
    //     hour0: startH,
    //     minute0: startM,
    //     hour1: endH,
    //     minute1: endM,
    //     frequency: settings.notificationFrequency,
    //   );
    // } catch (_) {}


    return lunarState;
  }

  Future<void> _refresh() async {
    try {
      state = AsyncData(await _computeState());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      state = AsyncData(await _computeState());
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/moon_painter.dart';

class LunarCycleScreen extends ConsumerWidget {
  const LunarCycleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunarAsync = ref.watch(lunarStateProvider);

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textSecondary),
        title: Text(
          'The Lunar Cycle',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.darkNavy, AppColors.deepIndigo],
          ),
        ),
        child: lunarAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mutedGold),
          ),
          error: (_, __) => const SizedBox.shrink(),
          data: (state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Circular moon phase diagram
                  SizedBox(
                    height: 420,
                    child: CustomPaint(
                      painter: _CycleDiagramPainter(
                        currentPhase: state.phase,
                        illumination: state.illumination,
                      ),
                      child: const SizedBox.expand(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Current position indicator
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.mutedGold.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _isActivePhase(state.phase)
                                ? AppColors.mutedGold
                                : AppColors.closedAmber,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You are here: ${state.phase.displayName}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Day ${state.dayInPhase + 1} of ${state.totalDaysInPhase}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.textMuted),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Phase descriptions
                  _PhaseRow(
                    phase: MoonPhase.newMoon,
                    illumination: 0.0,
                    title: 'New Moon — Plant',
                    description:
                        'Set your intentions. Name what you truly need. This is where the cycle begins.',
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.newMoon,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.waxing,
                    illumination: 0.5,
                    title: 'Waxing — Tend',
                    description:
                        'Repeat your intentions daily. Build belief through repetition. The moon grows, and so does your conviction.',
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.waxing,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.fullMoon,
                    illumination: 1.0,
                    title: 'Full Moon — Give Thanks',
                    description:
                        'Express gratitude as if you already have what you asked for. This is the peak — the moment of receiving.',
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.fullMoon,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.waning,
                    illumination: 0.5,
                    title: 'Waning — Release',
                    description:
                        'Let go completely. Stop pushing, stop checking. Trust that what you planted is growing in the dark.',
                    isActive: false,
                    isCurrent: state.phase == MoonPhase.waning,
                  ),

                  const SizedBox(height: 24),

                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _legendDot(AppColors.mutedGold),
                      const SizedBox(width: 6),
                      Text(
                        'Manifestation active',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.textMuted),
                      ),
                      const SizedBox(width: 24),
                      _legendDot(AppColors.closedAmber),
                      const SizedBox(width: 6),
                      Text(
                        'Release phase',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _isActivePhase(MoonPhase phase) {
    return phase == MoonPhase.newMoon ||
        phase == MoonPhase.waxing ||
        phase == MoonPhase.fullMoon;
  }

  static Widget _legendDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class _PhaseRow extends StatelessWidget {
  final MoonPhase phase;
  final double illumination;
  final String title;
  final String description;
  final bool isActive;
  final bool isCurrent;

  const _PhaseRow({
    required this.phase,
    required this.illumination,
    required this.title,
    required this.description,
    required this.isActive,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.cardDark : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isCurrent
            ? Border.all(
                color: isActive
                    ? AppColors.mutedGold.withValues(alpha: 0.4)
                    : AppColors.closedAmber.withValues(alpha: 0.4),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: SizedBox(
              width: 36,
              height: 36,
              child: CustomPaint(
                painter: MoonPainter(
                  illumination: illumination,
                  isWaxing: phase == MoonPhase.waxing ||
                      phase == MoonPhase.newMoon,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: isCurrent
                                      ? (isActive
                                          ? AppColors.mutedGold
                                          : AppColors.closedAmber)
                                      : AppColors.textPrimary,
                                  fontFamily: 'CormorantGaramond',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    if (isCurrent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: (isActive
                                  ? AppColors.mutedGold
                                  : AppColors.closedAmber)
                              .withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'NOW',
                          style: TextStyle(
                            color: isActive
                                ? AppColors.mutedGold
                                : AppColors.closedAmber,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for the circular moon phase diagram.
class _CycleDiagramPainter extends CustomPainter {
  final MoonPhase currentPhase;
  final double illumination;

  _CycleDiagramPainter({
    required this.currentPhase,
    required this.illumination,
  });

  static const _phases = [
    (MoonPhase.newMoon, 0.0, 'New Moon'),
    (MoonPhase.waxing, 0.25, 'Waxing\nCrescent'),
    (MoonPhase.waxing, 0.5, 'First\nQuarter'),
    (MoonPhase.waxing, 0.75, 'Waxing\nGibbous'),
    (MoonPhase.fullMoon, 1.0, 'Full Moon'),
    (MoonPhase.waning, 0.75, 'Waning\nGibbous'),
    (MoonPhase.waning, 0.5, 'Last\nQuarter'),
    (MoonPhase.waning, 0.25, 'Waning\nCrescent'),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final orbitRadius = math.min(size.width, size.height) / 2 - 70;
    const moonRadius = 22.0;

    // Draw solid inner orbit circle
    final innerRadius = orbitRadius - moonRadius - 10;
    final orbitPaint = Paint()
      ..color = AppColors.textMuted.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, innerRadius, orbitPaint);

    // Draw directional arrows (clockwise) on the inner orbit
    const arrowCount = 4;
    final arrowPaint = Paint()
      ..color = AppColors.textMuted.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    for (var i = 0; i < arrowCount; i++) {
      // Position arrows between the moon phases (at 45° offsets)
      final angle = (i / arrowCount) * 2 * math.pi - math.pi / 4;
      final ax = center.dx + innerRadius * math.cos(angle);
      final ay = center.dy + innerRadius * math.sin(angle);

      // Arrow points in the clockwise tangent direction
      final tangentAngle = angle + math.pi / 2;
      const arrowSize = 5.0;

      final tipX = ax + arrowSize * math.cos(tangentAngle);
      final tipY = ay + arrowSize * math.sin(tangentAngle);
      final leftX = ax + arrowSize * math.cos(tangentAngle + 2.5);
      final leftY = ay + arrowSize * math.sin(tangentAngle + 2.5);
      final rightX = ax + arrowSize * math.cos(tangentAngle - 2.5);
      final rightY = ay + arrowSize * math.sin(tangentAngle - 2.5);

      final arrowPath = Path()
        ..moveTo(tipX, tipY)
        ..lineTo(leftX, leftY)
        ..lineTo(rightX, rightY)
        ..close();
      canvas.drawPath(arrowPath, arrowPaint);
    }

    // Draw each moon phase around the circle
    for (var i = 0; i < _phases.length; i++) {
      final (phase, illum, label) = _phases[i];
      // Start from top (new moon), go clockwise
      final angle = (i / _phases.length) * 2 * math.pi - math.pi / 2;
      final x = center.dx + orbitRadius * math.cos(angle);
      final y = center.dy + orbitRadius * math.sin(angle);
      final moonCenter = Offset(x, y);

      final isCurrent = _isCurrentPosition(i);
      final isWaxing =
          phase == MoonPhase.waxing || phase == MoonPhase.newMoon;

      // Draw glow for current phase
      if (isCurrent) {
        final glowPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: 0.15)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);
        canvas.drawCircle(moonCenter, moonRadius + 10, glowPaint);

        final ringPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: 0.5)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(moonCenter, moonRadius + 5, ringPaint);
      }

      // Draw moon
      _drawMoon(canvas, moonCenter, moonRadius, illum, isWaxing);

      // Draw label — positioned well outside the moon
      final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: isCurrent
                ? AppColors.textPrimary
                : AppColors.textSecondary.withValues(alpha: 0.8),
            fontSize: isCurrent ? 13 : 12,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
            height: 1.3,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 80);

      // Push labels further out from the moons
      final labelRadius = orbitRadius + moonRadius + 22;
      final labelX = center.dx + labelRadius * math.cos(angle);
      final labelY = center.dy + labelRadius * math.sin(angle);
      textPainter.paint(
        canvas,
        Offset(
          labelX - textPainter.width / 2,
          labelY - textPainter.height / 2,
        ),
      );
    }
  }

  bool _isCurrentPosition(int index) {
    switch (currentPhase) {
      case MoonPhase.newMoon:
        return index == 0;
      case MoonPhase.waxing:
        // Approximate position based on illumination
        if (illumination < 0.4) return index == 1;
        if (illumination < 0.6) return index == 2;
        return index == 3;
      case MoonPhase.fullMoon:
        return index == 4;
      case MoonPhase.waning:
        if (illumination > 0.6) return index == 5;
        if (illumination > 0.4) return index == 6;
        return index == 7;
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius,
      double illumination, bool isWaxing) {
    // Dark base
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = AppColors.darkNavy,
    );

    if (illumination <= 0.01) return;

    final litPaint = Paint()..color = AppColors.moonSilver;

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      return;
    }

    final path = Path();
    final startAngle = isWaxing ? -math.pi / 2 : math.pi / 2;
    path.addArc(
        Rect.fromCircle(center: center, radius: radius), startAngle, math.pi);

    final terminatorXRadius = radius * (1 - 2 * illumination).abs();
    final isGibbous = illumination > 0.5;

    if (isWaxing) {
      path.addArc(
        Rect.fromCenter(
            center: center,
            width: terminatorXRadius * 2,
            height: radius * 2),
        isGibbous ? math.pi / 2 : -math.pi / 2,
        math.pi,
      );
    } else {
      path.addArc(
        Rect.fromCenter(
            center: center,
            width: terminatorXRadius * 2,
            height: radius * 2),
        isGibbous ? -math.pi / 2 : math.pi / 2,
        math.pi,
      );
    }

    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(_CycleDiagramPainter oldDelegate) =>
      oldDelegate.currentPhase != currentPhase ||
      oldDelegate.illumination != illumination;
}

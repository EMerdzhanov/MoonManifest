import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/l10n/app_localizations.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/ui/shared/cycle_timeline.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/moon_painter.dart';

class LunarCycleScreen extends ConsumerStatefulWidget {
  const LunarCycleScreen({super.key});

  @override
  ConsumerState<LunarCycleScreen> createState() => _LunarCycleScreenState();
}

class _LunarCycleScreenState extends ConsumerState<LunarCycleScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final lunarAsync = ref.watch(lunarStateProvider);

    // Build localized phase labels for the diagram painter
    final diagramLabels = [
      l10n.cycleDiagramNewMoon,
      l10n.cycleDiagramWaxingCrescent,
      l10n.cycleDiagramFirstQuarter,
      l10n.cycleDiagramWaxingGibbous,
      l10n.cycleDiagramFullMoon,
      l10n.cycleDiagramWaningGibbous,
      l10n.cycleDiagramLastQuarter,
      l10n.cycleDiagramWaningCrescent,
    ];

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textSecondary),
        title: Text(
          l10n.lunarCycleTitle,
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

                  // Circular moon phase diagram with pulse animation
                  SizedBox(
                    height: 440,
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) => CustomPaint(
                        painter: _CycleDiagramPainter(
                          currentPhase: state.phase,
                          illumination: state.illumination,
                          pulseValue: _pulseAnimation.value,
                          labels: diagramLabels,
                          manifestLabel: l10n.cycleDiagramManifest,
                          releaseLabel: l10n.cycleDiagramRelease,
                        ),
                        child: const SizedBox.expand(),
                      ),
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
                                l10n.lunarYouAreHere(state.phase.localizedName(context)),
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
                                l10n.lunarDayOfTotal(state.dayInPhase + 1, state.totalDaysInPhase),
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
                    title: l10n.lunarNewMoonPlant,
                    description: l10n.lunarNewMoonPlantDesc,
                    duration: l10n.lunarNewMoonDuration,
                    status: l10n.lunarNewMoonStatus,
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.newMoon,
                    nowLabel: l10n.lunarNow,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.waxing,
                    illumination: 0.5,
                    title: l10n.lunarWaxingTend,
                    description: l10n.lunarWaxingTendDesc,
                    duration: l10n.lunarWaxingDuration,
                    status: l10n.lunarWaxingStatus,
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.waxing,
                    nowLabel: l10n.lunarNow,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.fullMoon,
                    illumination: 1.0,
                    title: l10n.lunarFullMoonGiveThanks,
                    description: l10n.lunarFullMoonGiveThanksDesc,
                    duration: l10n.lunarFullMoonDuration,
                    status: l10n.lunarFullMoonStatus,
                    isActive: true,
                    isCurrent: state.phase == MoonPhase.fullMoon,
                    nowLabel: l10n.lunarNow,
                  ),
                  _PhaseRow(
                    phase: MoonPhase.waning,
                    illumination: 0.5,
                    title: l10n.lunarWaningRelease,
                    description: l10n.lunarWaningReleaseDesc,
                    duration: l10n.lunarWaningDuration,
                    status: l10n.lunarWaningStatus,
                    isActive: false,
                    isCurrent: state.phase == MoonPhase.waning,
                    nowLabel: l10n.lunarNow,
                  ),

                  const SizedBox(height: 24),

                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _legendDot(const Color(0xFF4A9E6B)),
                      const SizedBox(width: 6),
                      Text(
                        l10n.lunarLegendManifest,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFF4A9E6B)),
                      ),
                      const SizedBox(width: 24),
                      _legendDot(const Color(0xFF7B8CBA)),
                      const SizedBox(width: 6),
                      Text(
                        l10n.lunarLegendRelease,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFF7B8CBA)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // -- THIS CYCLE TIMELINE --
                  Text(
                    l10n.lunarThisCycle,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: AppColors.mutedGold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  CycleTimelineWidget(
                    entries: buildCycleTimeline(state, ref.read(moonPhaseEngineProvider)),
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
  final String duration;
  final String status;
  final bool isActive;
  final bool isCurrent;
  final String nowLabel;

  const _PhaseRow({
    required this.phase,
    required this.illumination,
    required this.title,
    required this.description,
    required this.duration,
    required this.status,
    required this.isActive,
    required this.isCurrent,
    required this.nowLabel,
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
                          nowLabel,
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
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.midNavy,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      status,
                      style: TextStyle(
                        color: isActive
                            ? const Color(0xFF4A9E6B)
                            : const Color(0xFF7B8CBA),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
  final double pulseValue;
  final List<String> labels;
  final String manifestLabel;
  final String releaseLabel;

  _CycleDiagramPainter({
    required this.currentPhase,
    required this.illumination,
    required this.pulseValue,
    required this.labels,
    required this.manifestLabel,
    required this.releaseLabel,
  });

  static const _phases = [
    (MoonPhase.newMoon, 0.0),
    (MoonPhase.waxing, 0.25),
    (MoonPhase.waxing, 0.5),
    (MoonPhase.waxing, 0.75),
    (MoonPhase.fullMoon, 1.0),
    (MoonPhase.waning, 0.75),
    (MoonPhase.waning, 0.5),
    (MoonPhase.waning, 0.25),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final orbitRadius = math.min(size.width, size.height) / 2 - 65;
    const moonRadius = 20.0;

    final innerRadius = orbitRadius - moonRadius - 24;
    const manifestColor = Color(0xFF4A9E6B);
    const releaseColor = Color(0xFF7B8CBA);

    final manifestPaint = Paint()
      ..color = manifestColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      -math.pi / 2,
      math.pi,
      false,
      manifestPaint,
    );

    final releasePaint = Paint()
      ..color = releaseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      math.pi / 2,
      math.pi,
      false,
      releasePaint,
    );

    void drawCurvedText(String text, double startAngle, double sweepAngle,
        double textRadius, Color color) {
      final chars = text.split('');
      final charSpacing = sweepAngle / (chars.length + 1);

      for (var i = 0; i < chars.length; i++) {
        final charAngle = startAngle + charSpacing * (i + 1);
        final cx = center.dx + textRadius * math.cos(charAngle);
        final cy = center.dy + textRadius * math.sin(charAngle);

        final tp = TextPainter(
          text: TextSpan(
            text: chars[i],
            style: TextStyle(
              color: color.withValues(alpha: 0.85),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        canvas.save();
        canvas.translate(cx, cy);
        canvas.rotate(charAngle + math.pi / 2);
        tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
        canvas.restore();
      }
    }

    drawCurvedText(
        manifestLabel, -math.pi / 2, math.pi, innerRadius - 16, manifestColor);
    drawCurvedText(
        releaseLabel, math.pi / 2, math.pi, innerRadius - 16, releaseColor);

    void drawArrow(double angle, Color color) {
      final ax = center.dx + innerRadius * math.cos(angle);
      final ay = center.dy + innerRadius * math.sin(angle);
      final tangentAngle = angle + math.pi / 2;
      const arrowLen = 10.0;
      const arrowWidth = 6.0;

      final tipX = ax + arrowLen * math.cos(tangentAngle);
      final tipY = ay + arrowLen * math.sin(tangentAngle);
      final leftX = ax + arrowWidth * math.cos(tangentAngle + 2.3);
      final leftY = ay + arrowWidth * math.sin(tangentAngle + 2.3);
      final rightX = ax + arrowWidth * math.cos(tangentAngle - 2.3);
      final rightY = ay + arrowWidth * math.sin(tangentAngle - 2.3);

      canvas.drawPath(
        Path()
          ..moveTo(tipX, tipY)
          ..lineTo(leftX, leftY)
          ..lineTo(rightX, rightY)
          ..close(),
        Paint()..color = color,
      );
    }

    drawArrow(-math.pi / 4, manifestColor);
    drawArrow(math.pi / 4, manifestColor);
    drawArrow(3 * math.pi / 4, releaseColor);
    drawArrow(5 * math.pi / 4, releaseColor);

    for (var i = 0; i < _phases.length; i++) {
      final (phase, illum) = _phases[i];
      final label = labels[i];
      final angle = (i / _phases.length) * 2 * math.pi - math.pi / 2;
      final x = center.dx + orbitRadius * math.cos(angle);
      final y = center.dy + orbitRadius * math.sin(angle);
      final moonCenter = Offset(x, y);

      final isCurrent = _isCurrentPosition(i);
      final isWaxing =
          phase == MoonPhase.waxing || phase == MoonPhase.newMoon;

      if (isCurrent) {
        final glowSize = moonRadius + 10 + (pulseValue * 6);
        final glowAlpha = 0.1 + (pulseValue * 0.12);
        final glowPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: glowAlpha)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);
        canvas.drawCircle(moonCenter, glowSize, glowPaint);

        final ringSize = moonRadius + 5 + (pulseValue * 2);
        final ringAlpha = 0.35 + (pulseValue * 0.3);
        final ringPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: ringAlpha)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5 + (pulseValue * 0.5);
        canvas.drawCircle(moonCenter, ringSize, ringPaint);
      }

      _drawMoon(canvas, moonCenter, moonRadius, illum, isWaxing);

      final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: isCurrent
                ? AppColors.textPrimary
                : AppColors.textSecondary.withValues(alpha: 0.8),
            fontSize: isCurrent ? 11 : 10,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
            height: 1.3,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 80);

      double offsetX;
      double offsetY;

      if (i == 2) {
        final moonX = center.dx + orbitRadius * math.cos(angle);
        final moonY = center.dy + orbitRadius * math.sin(angle);
        offsetX = moonX + moonRadius + 14;
        offsetY = moonY - textPainter.height / 2;
      } else if (i == 6) {
        final moonX = center.dx + orbitRadius * math.cos(angle);
        final moonY = center.dy + orbitRadius * math.sin(angle);
        offsetX = moonX - moonRadius - textPainter.width - 14;
        offsetY = moonY - textPainter.height / 2;
      } else {
        final labelRadius = orbitRadius + moonRadius + 32;
        final labelX = center.dx + labelRadius * math.cos(angle);
        final labelY = center.dy + labelRadius * math.sin(angle);
        offsetX = labelX - textPainter.width / 2;
        offsetY = labelY - textPainter.height / 2;
      }

      textPainter.paint(canvas, Offset(offsetX, offsetY));
    }
  }

  bool _isCurrentPosition(int index) {
    switch (currentPhase) {
      case MoonPhase.newMoon:
        return index == 0;
      case MoonPhase.waxing:
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
    const darkSideColor = Color(0xFF252D45);
    canvas.drawCircle(center, radius, Paint()..color = darkSideColor);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFF3A4260)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );

    if (illumination <= 0.01) return;

    final litPaint = Paint()..color = AppColors.moonSilver;

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      return;
    }

    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;

    final path = Path();

    if (isWaxing) {
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        math.pi,
      );
      if (isGibbous) {
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2,
          math.pi,
          false,
        );
      } else {
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2,
          -math.pi,
          false,
        );
      }
    } else {
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        -math.pi,
      );
      if (isGibbous) {
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2,
          -math.pi,
          false,
        );
      } else {
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2,
          math.pi,
          false,
        );
      }
    }

    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(_CycleDiagramPainter oldDelegate) =>
      oldDelegate.currentPhase != currentPhase ||
      oldDelegate.illumination != illumination ||
      oldDelegate.pulseValue != pulseValue;
}

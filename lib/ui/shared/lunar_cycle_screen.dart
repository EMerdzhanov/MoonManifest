import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
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
                      _legendDot(const Color(0xFF4A9E6B)),
                      const SizedBox(width: 6),
                      Text(
                        'Manifest',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFF4A9E6B)),
                      ),
                      const SizedBox(width: 24),
                      _legendDot(const Color(0xFF7B8CBA)),
                      const SizedBox(width: 6),
                      Text(
                        'Release',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: const Color(0xFF7B8CBA)),
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
  final double pulseValue; // 0.0 to 1.0, drives the glow animation

  _CycleDiagramPainter({
    required this.currentPhase,
    required this.illumination,
    required this.pulseValue,
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
    final orbitRadius = math.min(size.width, size.height) / 2 - 65;
    const moonRadius = 20.0;

    // Draw inner orbit as two colored arcs:
    // Green (manifest) = New Moon → Full Moon (right/clockwise, top to bottom)
    // Amber (release) = Full Moon → New Moon (left/clockwise, bottom to top)
    final innerRadius = orbitRadius - moonRadius - 24;
    const manifestColor = Color(0xFF4A9E6B); // soft green
    const releaseColor = Color(0xFF7B8CBA);  // soft blue

    // Manifest arc: from top (-π/2), sweep π clockwise to bottom
    final manifestPaint = Paint()
      ..color = manifestColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      -math.pi / 2, // start at top
      math.pi,      // sweep clockwise to bottom
      false,
      manifestPaint,
    );

    // Release arc: from bottom (π/2), sweep π clockwise to top
    final releasePaint = Paint()
      ..color = releaseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      math.pi / 2, // start at bottom
      math.pi,     // sweep clockwise to top
      false,
      releasePaint,
    );

    // Curved text: draw each character along the inside of the arc
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
        // Rotate character to follow the arc tangent + face inward
        canvas.rotate(charAngle + math.pi / 2);
        tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
        canvas.restore();
      }
    }

    // "MANIFEST" on the inside of the right (green) arc
    // Right arc goes from -π/2 (top) to π/2 (bottom)
    drawCurvedText(
        'MANIFEST', -math.pi / 2, math.pi, innerRadius - 16, manifestColor);

    // "RELEASE" on the inside of the left (blue) arc
    // Left arc goes from π/2 (bottom) to 3π/2 (top)
    drawCurvedText(
        'RELEASE', math.pi / 2, math.pi, innerRadius - 16, releaseColor);

    // Directional arrows — larger and more visible
    void drawArrow(double angle, Color color) {
      final ax = center.dx + innerRadius * math.cos(angle);
      final ay = center.dy + innerRadius * math.sin(angle);
      final tangentAngle = angle + math.pi / 2; // clockwise tangent
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

    // Green arrows on right arc (manifest)
    drawArrow(-math.pi / 4, manifestColor);  // top-right
    drawArrow(math.pi / 4, manifestColor);   // bottom-right
    // Blue arrows on left arc (release)
    drawArrow(3 * math.pi / 4, releaseColor);  // bottom-left
    drawArrow(5 * math.pi / 4, releaseColor);  // top-left

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

      // Draw pulsing glow for current phase
      if (isCurrent) {
        // Outer glow — pulses in size and opacity
        final glowSize = moonRadius + 10 + (pulseValue * 6);
        final glowAlpha = 0.1 + (pulseValue * 0.12);
        final glowPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: glowAlpha)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);
        canvas.drawCircle(moonCenter, glowSize, glowPaint);

        // Ring — pulses in opacity and slightly in size
        final ringSize = moonRadius + 5 + (pulseValue * 2);
        final ringAlpha = 0.35 + (pulseValue * 0.3);
        final ringPaint = Paint()
          ..color = AppColors.mutedGold.withValues(alpha: ringAlpha)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5 + (pulseValue * 0.5);
        canvas.drawCircle(moonCenter, ringSize, ringPaint);
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
            fontSize: isCurrent ? 11 : 10,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
            height: 1.3,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(maxWidth: 80);

      // Position labels to the side for left/right, radially outward for others.
      double offsetX;
      double offsetY;

      if (i == 2) {
        // First Quarter (right) — label just right of moon
        final moonX = center.dx + orbitRadius * math.cos(angle);
        final moonY = center.dy + orbitRadius * math.sin(angle);
        offsetX = moonX + moonRadius + 14;
        offsetY = moonY - textPainter.height / 2;
      } else if (i == 6) {
        // Last Quarter (left) — label just left of moon
        final moonX = center.dx + orbitRadius * math.cos(angle);
        final moonY = center.dy + orbitRadius * math.sin(angle);
        offsetX = moonX - moonRadius - textPainter.width - 14;
        offsetY = moonY - textPainter.height / 2;
      } else {
        final labelRadius = orbitRadius + moonRadius + 24;
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
    // Visible dark side — a blue-grey that's lighter than the background
    // so the full disc is always visible (like the reference image)
    const darkSideColor = Color(0xFF252D45);
    canvas.drawCircle(center, radius, Paint()..color = darkSideColor);

    // Subtle edge outline for definition
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

    // The terminator is an ellipse whose x-radius shrinks as illumination
    // moves away from 0.5 (half moon). At 0.5, it's a straight line (x=0).
    // At 0.25 (crescent), it curves into the lit side creating a thin sliver.
    // At 0.75 (gibbous), it curves into the dark side.
    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;

    final path = Path();

    // For waxing: lit side is on the RIGHT
    // For waning: lit side is on the LEFT
    //
    // Strategy: trace the outer circle arc on the lit side (top to bottom),
    // then trace back along the terminator ellipse (bottom to top).
    // This creates a single closed path = the lit crescent/gibbous shape.

    if (isWaxing) {
      // Outer arc: right half of circle, from top to bottom (clockwise)
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, // start at top
        math.pi, // sweep to bottom (right side)
      );
      // Terminator arc: back from bottom to top
      if (isGibbous) {
        // Gibbous: terminator curves LEFT (into dark side)
        // Arc from bottom to top along LEFT side of ellipse
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2, // start at bottom
          math.pi, // sweep back to top (left side of ellipse)
          false,
        );
      } else {
        // Crescent: terminator curves RIGHT (into lit side, narrowing it)
        // Arc from bottom to top along RIGHT side of ellipse
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2, // start at bottom
          -math.pi, // sweep back to top (right side of ellipse = negative sweep)
          false,
        );
      }
    } else {
      // Waning: lit side is on the LEFT
      // Outer arc: left half of circle, from top to bottom (counter-clockwise)
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, // start at top
        -math.pi, // sweep to bottom (left side)
      );
      // Terminator arc: back from bottom to top
      if (isGibbous) {
        // Gibbous: terminator curves RIGHT (into dark side)
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2, // start at bottom
          -math.pi, // sweep back to top (right side of ellipse)
          false,
        );
      } else {
        // Crescent: terminator curves LEFT (into lit side, narrowing it)
        path.arcTo(
          Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
          math.pi / 2, // start at bottom
          math.pi, // sweep back to top (left side of ellipse)
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

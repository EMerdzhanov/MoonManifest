import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class AuraMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final MoonPhase phase;
  final double size;

  const AuraMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    required this.phase,
    this.size = 120,
  });

  @override
  State<AuraMoon> createState() => _AuraMoonState();
}

class _AuraMoonState extends State<AuraMoon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 24000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => CustomPaint(
          painter: _AuraPainter(
            illumination: widget.illumination,
            phase: widget.phase,
            isWaxing: widget.isWaxing,
            time: _controller.value,
          ),
        ),
      ),
    );
  }
}

class _AuraPainter extends CustomPainter {
  final double illumination;
  final MoonPhase phase;
  final bool isWaxing;
  final double time;

  _AuraPainter({
    required this.illumination,
    required this.phase,
    required this.isWaxing,
    required this.time,
  });

  bool get _isManifest =>
      phase == MoonPhase.newMoon ||
      phase == MoonPhase.waxing ||
      phase == MoonPhase.fullMoon;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final auraColor = _isManifest ? AppColors.mutedGold : const Color(0xFF9AA8D0);

    // Background glow
    canvas.drawCircle(center, radius * 1.8, Paint()
      ..color = auraColor.withValues(alpha: 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 25));

    _drawParticles(canvas, center, radius, auraColor, behind: true);
    _drawMoon(canvas, center, radius);

    // Shimmer
    if (illumination > 0.05) {
      final rng = math.Random(55);
      for (var i = 0; i < 4; i++) {
        final ba = rng.nextDouble() * 2 * math.pi;
        final bd = rng.nextDouble() * radius * 0.6;
        final sp = (time * 2 + i * 0.25) % 1.0;
        final sa = math.sin(sp * math.pi) * 0.15;
        if (sa < 0.02) continue;
        canvas.drawCircle(
          Offset(center.dx + bd * math.cos(ba + time * 0.5),
              center.dy + bd * math.sin(ba + time * 0.3)),
          2 + rng.nextDouble() * 3,
          Paint()
            ..color = Colors.white.withValues(alpha: sa)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
        );
      }
    }

    _drawParticles(canvas, center, radius, auraColor, behind: false);
  }

  void _drawParticles(Canvas canvas, Offset center, double radius,
      Color auraColor, {required bool behind}) {
    final rng = math.Random(123);
    for (var i = 0; i < 30; i++) {
      final pAngle = rng.nextDouble() * 2 * math.pi;
      final pSpeed = 0.3 + rng.nextDouble() * 0.7;
      final pBase = 1.1 + rng.nextDouble() * 0.5;
      final pDrift = rng.nextDouble() * 0.2;
      final pOffset = rng.nextDouble();
      final pSize = 0.8 + rng.nextDouble() * 1.8;

      final t = (time + pOffset) % 1.0;
      final curAngle = pAngle + pSpeed * time * 2 * math.pi;
      final dist = (pBase + pDrift * math.sin(t * math.pi * 2)) * radius;
      final normAngle = curAngle % (2 * math.pi);
      final isBehind = normAngle > math.pi / 2 && normAngle < 3 * math.pi / 2;
      if (isBehind != behind) continue;

      final lifecycle = math.sin(t * math.pi);
      final alpha = lifecycle * 0.7;
      if (alpha < 0.05) continue;

      final px = center.dx + dist * math.cos(curAngle);
      final py = center.dy + dist * math.sin(curAngle);

      canvas.drawCircle(Offset(px, py), pSize * 2.5, Paint()
        ..color = auraColor.withValues(alpha: alpha * 0.2)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4));
      canvas.drawCircle(Offset(px, py), pSize, Paint()
        ..color = auraColor.withValues(alpha: alpha));
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1A2240));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4565)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.2, -0.2),
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFD5D5E2)],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.12, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16));
      return;
    }

    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;
    final path = Path();

    if (isWaxing) {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? math.pi : -math.pi, false,
      );
    } else {
      path.addArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, -math.pi);
      path.arcTo(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        math.pi / 2, isGibbous ? -math.pi : math.pi, false,
      );
    }
    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(_AuraPainter old) => true;
}

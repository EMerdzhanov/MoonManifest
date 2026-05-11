import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class HaloMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final MoonPhase phase;
  final double size;

  const HaloMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    required this.phase,
    this.size = 120,
  });

  @override
  State<HaloMoon> createState() => _HaloMoonState();
}

class _HaloMoonState extends State<HaloMoon>
    with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _glowController;
  late final AnimationController _sweepController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 12000),
    )..repeat();
    _glowController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);
    _sweepController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 7000),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _glowController.dispose();
    _sweepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([_rotationController, _glowController, _sweepController]),
        builder: (context, _) => CustomPaint(
          painter: _HaloPainter(
            illumination: widget.illumination,
            phase: widget.phase,
            isWaxing: widget.isWaxing,
            rotation: _rotationController.value * 2 * math.pi,
            glowValue: CurvedAnimation(parent: _glowController, curve: Curves.easeInOut).value,
            sweepValue: _sweepController.value,
          ),
        ),
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  final double illumination;
  final MoonPhase phase;
  final bool isWaxing;
  final double rotation;
  final double glowValue;
  final double sweepValue;

  _HaloPainter({
    required this.illumination,
    required this.phase,
    required this.isWaxing,
    required this.rotation,
    required this.glowValue,
    required this.sweepValue,
  });

  bool get _isManifest =>
      phase == MoonPhase.newMoon ||
      phase == MoonPhase.waxing ||
      phase == MoonPhase.fullMoon;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2;
    final scale = 1.0 + glowValue * 0.02;
    final r = maxRadius * scale;
    final ringColor = _isManifest ? AppColors.mutedGold : const Color(0xFF8090C0);

    // Glow layers
    canvas.drawCircle(center, r * 1.7, Paint()
      ..color = ringColor.withValues(alpha: 0.03 + glowValue * 0.03)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 35));
    canvas.drawCircle(center, r * 1.35, Paint()
      ..color = const Color(0xFFD0D4E8).withValues(alpha: 0.05 + glowValue * 0.05)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
    canvas.drawCircle(center, r * 1.1, Paint()
      ..color = AppColors.moonSilver.withValues(alpha: 0.08 + glowValue * 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10));

    // Halo ring
    final ringRadius = r * 1.25;
    for (var i = 0; i < 40; i++) {
      final segAngle = rotation + (i / 40) * 2 * math.pi;
      final segPhase = (i / 40 + glowValue * 0.3) % 1.0;
      final alpha = 0.08 + math.sin(segPhase * math.pi) * 0.25;
      canvas.drawCircle(
        Offset(center.dx + ringRadius * math.cos(segAngle),
            center.dy + ringRadius * math.sin(segAngle)),
        1.2,
        Paint()
          ..color = ringColor.withValues(alpha: alpha)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
      );
    }

    // 4 accent dots
    for (var i = 0; i < 4; i++) {
      final aa = rotation + (i / 4) * 2 * math.pi;
      final accentAlpha = 0.3 + glowValue * 0.3;
      final ap = Offset(center.dx + ringRadius * math.cos(aa),
          center.dy + ringRadius * math.sin(aa));
      canvas.drawCircle(ap, 2.0, Paint()
        ..color = ringColor.withValues(alpha: accentAlpha)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3));
      canvas.drawCircle(ap, 1.0, Paint()
        ..color = ringColor.withValues(alpha: accentAlpha));
    }

    // Moon body
    _drawMoon(canvas, center, r);

    // Light sweep
    if (illumination > 0.05 && illumination < 0.99) {
      final sa = sweepValue * 2 * math.pi;
      canvas.save();
      canvas.clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: r)));
      canvas.drawCircle(
        Offset(center.dx + r * 0.3 * math.cos(sa), center.dy + r * 0.3 * math.sin(sa)),
        r * 0.4,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.06 + glowValue * 0.03)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15),
      );
      canvas.restore();
    }
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1C2340));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4565).withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        radius: 1.2,
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFCCCCD8)],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.2, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.25 + glowValue * 0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
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
  bool shouldRepaint(_HaloPainter old) => true;
}

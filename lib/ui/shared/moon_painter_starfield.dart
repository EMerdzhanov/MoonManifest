import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class StarfieldMoon extends StatefulWidget {
  final double illumination;
  final bool isWaxing;
  final double size;

  const StarfieldMoon({
    super.key,
    required this.illumination,
    required this.isWaxing,
    this.size = 120,
  });

  @override
  State<StarfieldMoon> createState() => _StarfieldMoonState();
}

class _StarfieldMoonState extends State<StarfieldMoon>
    with TickerProviderStateMixin {
  late final AnimationController _breathController;
  late final AnimationController _starController;
  late final AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4800),
    )..repeat(reverse: true);
    _starController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat(reverse: true);
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathController.dispose();
    _starController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([_breathController, _starController, _glowController]),
        builder: (context, _) => CustomPaint(
          painter: _StarfieldPainter(
            illumination: widget.illumination,
            isWaxing: widget.isWaxing,
            breathValue: CurvedAnimation(parent: _breathController, curve: Curves.easeInOut).value,
            starValue: _starController.value,
            glowValue: CurvedAnimation(parent: _glowController, curve: Curves.easeInOut).value,
          ),
        ),
      ),
    );
  }
}

class _StarfieldPainter extends CustomPainter {
  final double illumination;
  final bool isWaxing;
  final double breathValue;
  final double starValue;
  final double glowValue;

  _StarfieldPainter({
    required this.illumination,
    required this.isWaxing,
    required this.breathValue,
    required this.starValue,
    required this.glowValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Clip to bounds so glow/stars don't leak outside
    canvas.save();
    canvas.clipRect(Offset.zero & size);

    final center = Offset(size.width / 2, size.height / 2);
    final baseRadius = math.min(size.width, size.height) / 2 - 6;
    final breathScale = 1.0 + (breathValue * 0.03);
    final radius = baseRadius * breathScale;

    // Stars
    final rng = math.Random(42);
    for (var i = 0; i < 20; i++) {
      final sx = rng.nextDouble() * size.width;
      final sy = rng.nextDouble() * size.height;
      if ((Offset(sx, sy) - center).distance < baseRadius * 0.7) continue;
      final phase = (starValue + i * 0.17) % 1.0;
      final twinkle = (math.sin(phase * math.pi * 2) + 1) / 2;
      canvas.drawCircle(
        Offset(sx, sy),
        0.5 + twinkle * 1.0,
        Paint()..color = Colors.white.withValues(alpha: 0.15 + twinkle * 0.6),
      );
    }

    // Glow layers
    canvas.drawCircle(
      center, radius * 1.6,
      Paint()
        ..color = const Color(0xFFA0A8D0).withValues(alpha: 0.04 + glowValue * 0.04)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30),
    );
    canvas.drawCircle(
      center, radius * 1.3,
      Paint()
        ..color = const Color(0xFFC0C4E0).withValues(alpha: 0.06 + glowValue * 0.06)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18),
    );
    canvas.drawCircle(
      center, radius * 1.08,
      Paint()
        ..color = AppColors.moonSilver.withValues(alpha: illumination * 0.12 + breathValue * 0.04)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    // Moon body
    _drawMoon(canvas, center, radius);

    // Craters
    if (illumination > 0.05) {
      final crng = math.Random(77);
      final craterPaint = Paint()..color = const Color(0xFFCDCDD8).withValues(alpha: 0.25);
      for (var i = 0; i < 6; i++) {
        final a = crng.nextDouble() * 2 * math.pi;
        final d = crng.nextDouble() * radius * 0.65;
        final cr = 1.5 + crng.nextDouble() * 3.5;
        canvas.drawCircle(
          Offset(center.dx + d * math.cos(a), center.dy + d * math.sin(a)),
          cr, craterPaint,
        );
      }
    }

    canvas.restore();
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    canvas.drawCircle(center, radius, Paint()..color = const Color(0xFF1E2540));
    canvas.drawCircle(center, radius, Paint()
      ..color = const Color(0xFF3A4260).withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8);

    if (illumination <= 0.01) return;

    final litPaint = Paint()
      ..shader = RadialGradient(
        colors: [AppColors.moonWhite, AppColors.moonSilver, const Color(0xFFD0D0DC)],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.15, Paint()
        ..color = AppColors.moonGlow.withValues(alpha: 0.25 + breathValue * 0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
      return;
    }

    canvas.drawPath(_buildTerminatorPath(center, radius), litPaint);
  }

  Path _buildTerminatorPath(Offset center, double radius) {
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
    return path;
  }

  @override
  bool shouldRepaint(_StarfieldPainter old) => true;
}

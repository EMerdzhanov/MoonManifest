import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';

class MoonPainter extends CustomPainter {
  final double illumination;
  final bool isWaxing;

  MoonPainter({required this.illumination, required this.isWaxing});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Dark base — visible disc slightly lighter than background
    const darkSideColor = Color(0xFF252D4A);
    canvas.drawCircle(center, radius, Paint()..color = darkSideColor);

    // Subtle edge ring for definition
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFF3A4260).withValues(alpha: 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    if (illumination <= 0.01) {
      // New moon — show outline ring and glow so it's clearly visible
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = AppColors.moonSilver.withValues(alpha: 0.25)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
      canvas.drawCircle(
        center,
        radius + 4,
        Paint()
          ..color = AppColors.moonSilver.withValues(alpha: 0.12)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
      );
      return;
    }

    // Gradient lit surface (matches the animated styles)
    final litPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.2, -0.2),
        colors: [
          AppColors.moonWhite,
          AppColors.moonSilver,
          const Color(0xFFD0D0DC),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    if (illumination >= 0.99) {
      // Full moon with gradient and bloom
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(
        center,
        radius * 1.12,
        Paint()
          ..color = AppColors.moonGlow.withValues(alpha: 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20),
      );
      return;
    }

    // Partial illumination using terminator
    final terminatorXRadius = radius * (2 * illumination - 1).abs();
    final isGibbous = illumination > 0.5;

    final path = Path();
    if (isWaxing) {
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        math.pi,
      );
      path.arcTo(
        Rect.fromCenter(
          center: center,
          width: terminatorXRadius * 2,
          height: radius * 2,
        ),
        math.pi / 2,
        isGibbous ? math.pi : -math.pi,
        false,
      );
    } else {
      path.addArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        -math.pi,
      );
      path.arcTo(
        Rect.fromCenter(
          center: center,
          width: terminatorXRadius * 2,
          height: radius * 2,
        ),
        math.pi / 2,
        isGibbous ? -math.pi : math.pi,
        false,
      );
    }

    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(MoonPainter oldDelegate) =>
      oldDelegate.illumination != illumination ||
      oldDelegate.isWaxing != isWaxing;
}

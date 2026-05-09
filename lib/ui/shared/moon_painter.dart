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

    // Visible dark side — slightly lighter than background
    const darkSideColor = Color(0xFF1E2540);
    canvas.drawCircle(center, radius, Paint()..color = darkSideColor);

    if (illumination <= 0.01) {
      // New moon — show outline ring and faint glow so it's visible
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = AppColors.moonSilver.withValues(alpha: 0.15)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0,
      );
      // Subtle outer glow
      canvas.drawCircle(
        center,
        radius + 4,
        Paint()
          ..color = AppColors.moonSilver.withValues(alpha: 0.06)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
      );
      return;
    }

    final litPaint = Paint()..color = AppColors.moonSilver;

    if (illumination >= 0.99) {
      // Full moon with glow
      canvas.drawCircle(center, radius, litPaint);
      canvas.drawCircle(center, radius * 1.1, Paint()..color = AppColors.moonGlow..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
      return;
    }

    // Partial illumination using two arcs
    final path = Path();
    final startAngle = isWaxing ? -math.pi / 2 : math.pi / 2;
    path.addArc(Rect.fromCircle(center: center, radius: radius), startAngle, math.pi);

    final terminatorXRadius = radius * (1 - 2 * illumination).abs();
    final isGibbous = illumination > 0.5;

    if (isWaxing) {
      path.addArc(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        isGibbous ? math.pi / 2 : -math.pi / 2,
        math.pi,
      );
    } else {
      path.addArc(
        Rect.fromCenter(center: center, width: terminatorXRadius * 2, height: radius * 2),
        isGibbous ? -math.pi / 2 : math.pi / 2,
        math.pi,
      );
    }

    path.close();
    canvas.drawPath(path, litPaint);
  }

  @override
  bool shouldRepaint(MoonPainter oldDelegate) =>
      oldDelegate.illumination != illumination || oldDelegate.isWaxing != isWaxing;
}

import 'package:flutter/material.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'moon_painter.dart';

class MoonPhaseIndicator extends StatelessWidget {
  final double illumination;
  final MoonPhase phase;
  final double size;

  const MoonPhaseIndicator({super.key, required this.illumination, required this.phase, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MoonPainter(
          illumination: illumination,
          isWaxing: phase == MoonPhase.waxing || phase == MoonPhase.newMoon,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/settings_provider.dart';
import 'package:moon_manifest/ui/shared/moon_painter.dart';
import 'package:moon_manifest/ui/shared/moon_painter_starfield.dart';
import 'package:moon_manifest/ui/shared/moon_painter_aura.dart';
import 'package:moon_manifest/ui/shared/moon_painter_halo.dart';

class MoonPhaseIndicator extends ConsumerWidget {
  final double illumination;
  final MoonPhase phase;
  final double size;

  const MoonPhaseIndicator({
    super.key,
    required this.illumination,
    required this.phase,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moonStyle = ref.watch(
      settingsProvider.select((s) => s.moonStyle),
    );
    final isWaxing = phase == MoonPhase.waxing || phase == MoonPhase.newMoon;

    return switch (moonStyle) {
      'starfield' => StarfieldMoon(
          illumination: illumination, isWaxing: isWaxing, size: size),
      'aura' => AuraMoon(
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      'halo' => HaloMoon(
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      _ => SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: MoonPainter(illumination: illumination, isWaxing: isWaxing),
          ),
        ),
    };
  }
}

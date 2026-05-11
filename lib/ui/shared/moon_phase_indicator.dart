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
  /// When set, forces a specific style instead of reading the setting.
  /// Used by the style picker to show live previews.
  final String? styleOverride;

  const MoonPhaseIndicator({
    super.key,
    required this.illumination,
    required this.phase,
    this.size = 120,
    this.styleOverride,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moonStyle = styleOverride ??
        ref.watch(settingsProvider.select((s) => s.moonStyle));
    final isWaxing = phase == MoonPhase.waxing || phase == MoonPhase.newMoon;

    final moon = switch (moonStyle) {
      'starfield' => StarfieldMoon(
          key: const ValueKey('starfield'),
          illumination: illumination, isWaxing: isWaxing, size: size),
      'aura' => AuraMoon(
          key: const ValueKey('aura'),
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      'halo' => HaloMoon(
          key: const ValueKey('halo'),
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: size),
      _ => SizedBox(
          key: const ValueKey('classic'),
          width: size,
          height: size,
          child: CustomPaint(
            painter: MoonPainter(illumination: illumination, isWaxing: isWaxing),
          ),
        ),
    };

    // Skip AnimatedSwitcher for overridden previews (no transitions needed)
    if (styleOverride != null) return moon;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: moon,
    );
  }
}

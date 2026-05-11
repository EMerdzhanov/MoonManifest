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

    // Give painters extra space for glow/particle effects beyond the moon body.
    // The layout footprint stays at `size` via the outer SizedBox.
    final renderSize = size + 24;

    final moon = switch (moonStyle) {
      'starfield' => StarfieldMoon(
          key: const ValueKey('starfield'),
          illumination: illumination, isWaxing: isWaxing, size: renderSize),
      'aura' => AuraMoon(
          key: const ValueKey('aura'),
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: renderSize),
      'halo' => HaloMoon(
          key: const ValueKey('halo'),
          illumination: illumination, isWaxing: isWaxing, phase: phase, size: renderSize),
      _ => SizedBox(
          key: const ValueKey('classic'),
          width: renderSize,
          height: renderSize,
          child: CustomPaint(
            painter: MoonPainter(illumination: illumination, isWaxing: isWaxing),
          ),
        ),
    };

    // Wrap in a fixed-size box so layout stays at `size`, but allow the
    // painter to overflow for glow/particle effects.
    final wrapped = SizedBox(
      width: size,
      height: size,
      child: OverflowBox(
        maxWidth: renderSize,
        maxHeight: renderSize,
        child: moon,
      ),
    );

    // Skip AnimatedSwitcher for overridden previews (no transitions needed)
    if (styleOverride != null) return wrapped;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: wrapped,
    );
  }
}

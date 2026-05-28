import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/cycle_progress_bar.dart';
import 'package:moon_manifest/ui/shared/debug_controls.dart';
import 'package:moon_manifest/ui/shared/lunar_cycle_screen.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';

class CalmScaffold extends StatelessWidget {
  final Widget body;
  final bool showSettings;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onHistoryTap;

  const CalmScaffold({super.key, required this.body, this.showSettings = true, this.onSettingsTap, this.onHistoryTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColors.darkNavy, AppColors.deepIndigo]),
        ),
        child: Stack(
          children: [
            const _StarField(),
            SafeArea(
              child: Stack(
                children: [
              // Body fills full height — moon effects can extend behind the icon bar
              // Top padding pushes content below the floating icon bar
              Column(
                children: [
                  Expanded(child: body),
                  if (showSettings) ...[
                    const CycleProgressBar(),
                    const SizedBox(height: 8),
                  ],
                ],
              ),
              // Icon bar floats on top, transparent background
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: DebugControls(),
                  ),
                  if (showSettings)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu_book_outlined, color: AppColors.textMuted, size: 22),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const ManifestationGuideScreen()),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.dark_mode_outlined, color: AppColors.textMuted, size: 22),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const LunarCycleScreen()),
                            ),
                          ),
                          if (onHistoryTap != null)
                            IconButton(icon: const Icon(Icons.auto_stories_outlined, color: AppColors.textMuted, size: 22), onPressed: onHistoryTap),
                          if (onSettingsTap != null)
                            IconButton(icon: const Icon(Icons.settings_outlined, color: AppColors.textMuted, size: 22), onPressed: onSettingsTap),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}

class _StarField extends StatelessWidget {
  const _StarField();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _StarPainter(),
    );
  }
}

class _StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(42); // fixed seed for consistent layout
    const starCount = 60;

    for (var i = 0; i < starCount; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final radius = 0.3 + rng.nextDouble() * 0.7; // 0.3–1.0px
      final opacity = 0.05 + rng.nextDouble() * 0.15; // 0.05–0.20

      final paint = Paint()
        ..color = Colors.white.withValues(alpha: opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

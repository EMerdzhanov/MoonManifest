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
        child: SafeArea(
          child: Stack(
            children: [
              // Body fills full height — moon effects can extend behind the icon bar
              // Top padding pushes content below the floating icon bar
              Column(
                children: [
                  if (showSettings) const SizedBox(height: 56),
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
                  const Align(alignment: Alignment.topCenter, child: DebugControls()),
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
      ),
    );
  }
}

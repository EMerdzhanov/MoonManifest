import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/manifestation_guide_screen.dart';
import 'package:moon_manifest/ui/shared/lunar_cycle_screen.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class WaitingScreen extends ConsumerStatefulWidget {
  const WaitingScreen({super.key});

  @override
  ConsumerState<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends ConsumerState<WaitingScreen> {
  final TextEditingController _scratchpadController = TextEditingController();
  bool _scratchpadLoaded = false;

  @override
  void dispose() {
    _scratchpadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);
    final scratchpadAsync = ref.watch(scratchpadProvider);

    // Load scratchpad text on first build
    if (!_scratchpadLoaded) {
      scratchpadAsync.whenData((text) {
        if (text != null && _scratchpadController.text != text) {
          _scratchpadController.text = text;
          _scratchpadController.selection = TextSelection.fromPosition(
            TextPosition(offset: _scratchpadController.text.length),
          );
        }
        _scratchpadLoaded = true;
      });
    }

    return CalmScaffold(
      onHistoryTap: () => context.push('/history'),
      onSettingsTap: () => context.push('/settings'),
      body: lunarAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.mutedGold),
        ),
        error: (err, _) => Center(
          child: Text(
            'Something went wrong.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        data: (state) {
          final engine = ref.read(moonPhaseEngineProvider);
          final nextNewMoon = state.nextNewMoon;
          final daysUntil = nextNewMoon.difference(engine.now).inDays;
          final formattedDate =
              DateFormat('MMMM d').format(nextNewMoon);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 92),
                MoonPhaseIndicator(
                  illumination: state.illumination,
                  phase: state.phase,
                  size: 140,
                ),
                const SizedBox(height: 48),
                Text(
                  'Your first cycle begins at the new moon on $formattedDate.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$daysUntil',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                              fontFamily: 'CormorantGaramond',
                              fontSize: 64,
                              color: AppColors.mutedGold,
                            ),
                      ),
                      Text(
                        daysUntil == 1 ? 'day away' : 'days away',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                  letterSpacing: 1.2,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Prepare while you wait
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prepare while you wait',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.mutedGold,
                        ),
                  ),
                ),
                const SizedBox(height: 12),

                _PrepCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Learn how to manifest',
                  subtitle: 'The 4 rules that make this practice work',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ManifestationGuideScreen()),
                  ),
                ),
                const SizedBox(height: 10),
                _PrepCard(
                  icon: Icons.dark_mode_outlined,
                  title: 'Understand the lunar cycle',
                  subtitle: 'See where you are and what each phase means',
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const LunarCycleScreen()),
                  ),
                ),

                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Draft your intentions',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Use this space to reflect and prepare. What do you wish to call in?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _scratchpadController,
                  maxLines: 8,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write freely here\u2026',
                    filled: true,
                    fillColor: AppColors.cardDark,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: AppColors.mutedGold, width: 1),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                  onChanged: (text) {
                    ref.read(scratchpadProvider.notifier).save(text);
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PrepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PrepCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.mutedGold.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22, color: AppColors.mutedGold),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

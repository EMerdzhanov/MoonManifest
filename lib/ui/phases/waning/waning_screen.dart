import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class WaningScreen extends ConsumerWidget {
  const WaningScreen({super.key});

  void _showWhyQuiet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(28, 24, 28, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'The Waning Phase',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Your manifestation practice follows the lunar cycle. '
              'During the waning moon, the practice is to release — '
              'to let go of control and trust that your intentions are unfolding.\n\n'
              'This quiet is intentional. The app steps back so you can too.\n\n'
              'When the new moon arrives, you\'ll set fresh intentions '
              'and the cycle begins again.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.7,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunarAsync = ref.watch(lunarStateProvider);

    return CalmScaffold(
      onSettingsTap: () => context.push('/settings'),
      onHistoryTap: () => context.push('/history'),
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
          final formattedDate = DateFormat('MMMM d').format(state.nextNewMoon);

          final daysUntil = state.nextNewMoon.difference(DateTime.now().toUtc()).inDays;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.cardDark,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.mutedGold.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manifestation window closed',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Opens again in $daysUntil days at the new moon',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textMuted,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 3),
                MoonPhaseIndicator(
                  illumination: state.illumination,
                  phase: state.phase,
                  size: 120,
                ),
                const SizedBox(height: 32),
                Text(
                  'Release. Trust.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.3,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'The work is done.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.mutedGold,
                        letterSpacing: 1.0,
                      ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Next new moon: $formattedDate',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textMuted,
                        letterSpacing: 0.6,
                      ),
                ),
                const Spacer(flex: 4),
                GestureDetector(
                  onTap: () => _showWhyQuiet(context),
                  child: Text(
                    'Why is it quiet?',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted.withValues(alpha: 0.6),
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textMuted.withValues(alpha: 0.4),
                        ),
                  ),
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

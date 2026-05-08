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
          final formattedDate =
              DateFormat('MMMM d').format(state.nextNewMoon);
          final daysUntil =
              state.nextNewMoon.difference(DateTime.now().toUtc()).inDays;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Tappable banner
                GestureDetector(
                  onTap: () => context.push('/philosophy'),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Opens again in $daysUntil days at the new moon',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.textMuted,
                          size: 20,
                        ),
                      ],
                    ),
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
                  style:
                      Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                ),
                const SizedBox(height: 8),
                Text(
                  'The work is done.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(
                        color: AppColors.mutedGold,
                        letterSpacing: 1.0,
                      ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Next new moon: $formattedDate',
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textMuted,
                            letterSpacing: 0.6,
                          ),
                ),
                const Spacer(flex: 4),
                GestureDetector(
                  onTap: () => context.push('/philosophy'),
                  child: Text(
                    'Why is it quiet?',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              AppColors.textMuted.withValues(alpha: 0.6),
                          decoration: TextDecoration.underline,
                          decorationColor:
                              AppColors.textMuted.withValues(alpha: 0.4),
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

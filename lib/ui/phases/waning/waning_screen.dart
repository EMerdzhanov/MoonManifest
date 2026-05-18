import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/core/wisdom/daily_wisdom.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';
import 'package:moon_manifest/ui/phases/waning/manifestation_philosophy_screen.dart';

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
          final engine = ref.read(moonPhaseEngineProvider);
          final daysUntil =
              state.nextNewMoon.difference(engine.now).inDays;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Tappable banner
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ManifestationPhilosophyScreen(),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.closedAmberDim,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.closedAmber.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.closedAmber,
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
                                      color: AppColors.closedAmber,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Opens again in $daysUntil days at the new moon',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.closedAmber.withValues(alpha: 0.7),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.closedAmber.withValues(alpha: 0.5),
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
                  size: 140,
                ),
                const SizedBox(height: 48),
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
                  'Next new moon',
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                ),
                const SizedBox(height: 4),
                Text(
                  formattedDate,
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.mutedGold,
                            fontWeight: FontWeight.w600,
                          ),
                ),
                const Spacer(flex: 2),
                _DailyWisdomWidget(dayInPhase: state.dayInPhase),
                const Spacer(flex: 2),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ManifestationPhilosophyScreen(),
                    ),
                  ),
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

class _DailyWisdomWidget extends StatelessWidget {
  final int dayInPhase;

  const _DailyWisdomWidget({required this.dayInPhase});

  @override
  Widget build(BuildContext context) {
    final quote = DailyWisdom.forDay(dayInPhase);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '\u201c${quote.text}\u201d',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'CormorantGaramond',
              fontSize: 17,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
              color: Color(0xFFD4A574),
              height: 1.55,
            ).apply(color: AppColors.mutedGold.withValues(alpha: 0.75)),
          ),
          if (quote.author != null) ...[
            const SizedBox(height: 8),
            Text(
              '\u2014 ${quote.author}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textMuted,
                letterSpacing: 0.4,
              ).apply(color: AppColors.textMuted.withValues(alpha: 0.7)),
            ),
          ],
        ],
      ),
    );
  }
}

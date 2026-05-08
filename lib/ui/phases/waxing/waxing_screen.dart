import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_manifest/providers/cycle_provider.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/calm_scaffold.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class WaxingScreen extends ConsumerStatefulWidget {
  const WaxingScreen({super.key});

  @override
  ConsumerState<WaxingScreen> createState() => _WaxingScreenState();
}

class _WaxingScreenState extends ConsumerState<WaxingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _breathController;
  late final Animation<double> _breathAnimation;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _breathAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  void _showFocusOverlay(BuildContext context, String intentionText) {
    HapticFeedback.lightImpact();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss focus overlay',
      barrierColor: Colors.transparent,
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return _FocusOverlay(
          intentionText: intentionText,
          breathAnimation: _breathAnimation,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lunarAsync = ref.watch(lunarStateProvider);
    final cycleAsync = ref.watch(activeCycleProvider);

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
        data: (lunarState) {
          final engine = ref.read(moonPhaseEngineProvider);
          final daysUntilFull =
              lunarState.nextFullMoon.difference(engine.now).inDays;

          final totalDays = lunarState.totalDaysInPhase > 0
              ? lunarState.totalDaysInPhase
              : 15;
          final progress =
              (lunarState.dayInPhase / totalDays).clamp(0.0, 1.0);

          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                MoonPhaseIndicator(
                  illumination: lunarState.illumination,
                  phase: lunarState.phase,
                  size: 140,
                ),
                const SizedBox(height: 32),
                Text(
                  'Day ${lunarState.dayInPhase} of waxing.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  daysUntilFull == 1
                      ? 'Full moon tomorrow.'
                      : 'Full moon in $daysUntilFull days.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.mutedGold,
                      ),
                ),
                const SizedBox(height: 12),
                // Progress bar toward full moon
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: 3,
                      decoration: BoxDecoration(
                        color: AppColors.mutedGold.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.mutedGold,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Intentions',
                    style:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                  ),
                ),
                const SizedBox(height: 12),
                cycleAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(
                        color: AppColors.mutedGold),
                  ),
                  error: (err, _) => Text(
                    'Unable to load intentions.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  data: (cycle) {
                    if (cycle == null || cycle.intentions.isEmpty) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.cardDark,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'No intentions found for this cycle.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textMuted),
                        ),
                      );
                    }

                    return Column(
                      children: cycle.intentions
                          .map(
                            (intention) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () => _showFocusOverlay(
                                    context, intention.text),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: AppColors.cardDark,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.mutedGold
                                          .withValues(alpha: 0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                          Icons.brightness_2_outlined,
                                          color: AppColors.mutedGold,
                                          size: 16),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          intention.text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.textPrimary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
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

class _FocusOverlay extends StatelessWidget {
  const _FocusOverlay({
    required this.intentionText,
    required this.breathAnimation,
  });

  final String intentionText;
  final Animation<double> breathAnimation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Material(
        color: AppColors.deepIndigo.withValues(alpha: 0.92),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AnimatedBuilder(
                animation: breathAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: breathAnimation.value,
                    child: child,
                  );
                },
                child: Text(
                  intentionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'CormorantGaramond',
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mutedGold,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

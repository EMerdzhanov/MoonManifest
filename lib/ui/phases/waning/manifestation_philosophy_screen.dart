import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class ManifestationPhilosophyScreen extends ConsumerWidget {
  const ManifestationPhilosophyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunarAsync = ref.watch(lunarStateProvider);

    return Scaffold(
      backgroundColor: AppColors.deepIndigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: AppColors.textSecondary),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.darkNavy, AppColors.deepIndigo],
          ),
        ),
        child: lunarAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mutedGold),
          ),
          error: (_, __) => const SizedBox.shrink(),
          data: (state) {
            final nextNewMoon = state.nextNewMoon.toLocal();
            final dateStr = DateFormat('MMMM d').format(nextNewMoon);
            final daysUntil =
                state.nextNewMoon.difference(DateTime.now().toUtc()).inDays;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Moon
                  Center(
                    child: MoonPhaseIndicator(
                      illumination: state.illumination,
                      phase: state.phase,
                      size: 80,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Title
                  Center(
                    child: Text(
                      'The Ancient Practice',
                      style:
                          Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: AppColors.textPrimary,
                                height: 1.3,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Section 1
                  _body(
                    context,
                    'Long before this app, before electricity, before written language — '
                    'humans looked to the moon. Every ancient civilization understood '
                    'what modern life has forgotten: there is a rhythm to creation, '
                    'and it is not yours to control.',
                  ),

                  const SizedBox(height: 20),

                  _body(
                    context,
                    'The Babylonians planted by it. The Egyptians built temples aligned to it. '
                    'Fishermen, farmers, and healers have followed its pull for millennia. '
                    'The moon governs the tides, the harvests, and — if you let it — '
                    'the unfolding of your deepest intentions.',
                  ),

                  const SizedBox(height: 40),

                  // Section 2
                  _heading(context, 'Why You Cannot Simply Begin'),

                  const SizedBox(height: 16),

                  _body(
                    context,
                    'Manifestation is not a vending machine. You do not insert a wish '
                    'and receive an outcome. It is a covenant between your will and '
                    'the forces that move beneath the surface of things.',
                  ),

                  const SizedBox(height: 20),

                  _body(
                    context,
                    'This covenant demands alignment. You would not plant seeds in winter '
                    'and blame the earth for your empty harvest. In the same way, '
                    'you cannot set intentions at any moment and expect the universe '
                    'to rearrange itself on your schedule.',
                  ),

                  const SizedBox(height: 20),

                  _body(
                    context,
                    'The waning moon is not a pause. It is the most demanding phase of all. '
                    'Anyone can ask. Anyone can repeat. But to release — to truly let go '
                    'and trust that what you planted is growing in darkness — '
                    'that requires the discipline this practice was built on.',
                  ),

                  const SizedBox(height: 40),

                  // Section 3
                  _heading(context, 'The Four Sacred Phases'),

                  const SizedBox(height: 16),

                  _phaseDescription(
                    context,
                    MoonPhase.newMoon,
                    0.0,
                    'The Planting',
                    'In darkness, you name what you need — not what you want, '
                    'but what your soul requires. The new moon holds space for raw truth.',
                  ),

                  const SizedBox(height: 20),

                  _phaseDescription(
                    context,
                    MoonPhase.waxing,
                    0.5,
                    'The Tending',
                    'As light returns, you repeat your intentions daily. '
                    'Not as hope, but as certainty. You are not asking — you are remembering '
                    'what is already on its way.',
                  ),

                  const SizedBox(height: 20),

                  _phaseDescription(
                    context,
                    MoonPhase.fullMoon,
                    1.0,
                    'The Gratitude',
                    'At full illumination, you give thanks as though you already hold '
                    'what you asked for. This is not pretending. This is the act '
                    'that collapses the distance between where you are and where you are going.',
                  ),

                  const SizedBox(height: 20),

                  _phaseDescription(
                    context,
                    MoonPhase.waning,
                    0.5,
                    'The Release',
                    'And then — silence. You let go. You stop pushing, stop checking, '
                    'stop asking. The waning moon teaches the hardest lesson: '
                    'that your work is done, and now it belongs to something larger than you.',
                  ),

                  const SizedBox(height: 40),

                  // Section 4
                  _heading(context, 'The Closed Window'),

                  const SizedBox(height: 16),

                  _body(
                    context,
                    'You are here now, in the silence. The manifestation window is closed — '
                    'not because you have failed, but because this is where the practice '
                    'proves itself. Restraint is not absence. It is concentrated power.',
                  ),

                  const SizedBox(height: 20),

                  _body(
                    context,
                    'Every day you wait, your next intention grows sharper. '
                    'Every day you resist the urge to force an outcome, '
                    'you build the trust that makes manifestation possible.',
                  ),

                  const SizedBox(height: 40),

                  // Countdown
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.mutedGold.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$daysUntil',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: AppColors.mutedGold,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'days until the window opens',
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dateStr,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Closing
                  Center(
                    child: Text(
                      'When the moon returns to darkness,\nyou begin.',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.mutedGold,
                                fontStyle: FontStyle.italic,
                                height: 1.5,
                              ),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _heading(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: AppColors.mutedGold,
            height: 1.3,
          ),
    );
  }

  Widget _body(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.8,
          ),
    );
  }

  Widget _phaseDescription(
    BuildContext context,
    MoonPhase phase,
    double illumination,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: MoonPhaseIndicator(
            illumination: illumination,
            phase: phase,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontFamily: 'CormorantGaramond',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

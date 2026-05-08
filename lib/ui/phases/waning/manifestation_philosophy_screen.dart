import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/notifications/notification_service.dart';
import 'package:moon_manifest/providers/lunar_state_provider.dart';
import 'package:moon_manifest/theme/app_colors.dart';
import 'package:moon_manifest/ui/shared/moon_phase_indicator.dart';

class ManifestationPhilosophyScreen extends ConsumerStatefulWidget {
  const ManifestationPhilosophyScreen({super.key});

  @override
  ConsumerState<ManifestationPhilosophyScreen> createState() =>
      _ManifestationPhilosophyScreenState();
}

class _ManifestationPhilosophyScreenState
    extends ConsumerState<ManifestationPhilosophyScreen> {
  bool _reminderSet = false;

  Future<void> _scheduleReminder(DateTime nextNewMoon) async {
    try {
      final scheduledDate = tz.TZDateTime.from(nextNewMoon, tz.local)
          .subtract(const Duration(hours: 1));
      final now = tz.TZDateTime.now(tz.local);

      if (scheduledDate.isBefore(now)) return;

      await NotificationService.plugin.zonedSchedule(
        3000,
        'The manifestation window is open.',
        'Set your intentions now.',
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'moon_manifest_reminder',
            'Window Reminders',
            channelDescription: 'Reminds you when the manifestation window opens',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );

      setState(() => _reminderSet = true);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not schedule reminder')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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

                  // ── WHY THE WINDOW IS CLOSED ──
                  Center(
                    child: Text(
                      'Why Is the Window\nClosed Right Now?',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),

                  _body(context,
                      'Manifestation doesn\'t work on your schedule — it works on the moon\'s. '
                      'The lunar cycle has specific windows where setting intentions is powerful, '
                      'and periods where the most powerful thing you can do is nothing.'),

                  const SizedBox(height: 16),

                  _body(context,
                      'Right now, the moon is waning — shrinking toward darkness. '
                      'This is the release phase. Your intentions from this cycle have been planted, '
                      'tended, and offered in gratitude. Now they need space to take root. '
                      'Pushing harder during this phase doesn\'t help. It interferes.'),

                  const SizedBox(height: 16),

                  _body(context,
                      'When the new moon arrives, the window opens again. '
                      'That\'s when you set fresh intentions and begin a new cycle. '
                      'The wait isn\'t wasted time — it\'s part of the practice. '
                      'The discipline of release is what separates manifestation from wishing.'),

                  const SizedBox(height: 28),

                  // Countdown
                  Center(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 24),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dateStr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.textMuted),
                          ),
                          const SizedBox(height: 20),

                          // CTA: Remind me
                          SizedBox(
                            width: double.infinity,
                            child: _reminderSet
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    decoration: BoxDecoration(
                                      color: AppColors.mutedGold
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.check_circle,
                                            size: 18, color: AppColors.mutedGold),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Reminder set for $dateStr',
                                          style: TextStyle(
                                            color: AppColors.mutedGold,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : ElevatedButton.icon(
                                    onPressed: () =>
                                        _scheduleReminder(state.nextNewMoon),
                                    icon: const Icon(
                                        Icons.notifications_active_outlined,
                                        size: 18),
                                    label:
                                        const Text('Remind me when it opens'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mutedGold,
                                      foregroundColor: AppColors.deepIndigo,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // ── Divider ──
                  Center(
                    child: Container(
                      width: 40,
                      height: 1,
                      color: AppColors.textMuted.withValues(alpha: 0.3),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // ── THE HOOK ──

                  // Moon
                  Center(
                    child: MoonPhaseIndicator(
                      illumination: state.illumination,
                      phase: state.phase,
                      size: 80,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Center(
                    child: Text(
                      'What They Know\nThat You Don\'t',
                      style:
                          Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: AppColors.textPrimary,
                                height: 1.3,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  _body(context,
                      'The most successful people on earth don\'t just set goals. '
                      'They work with timing. They understand something most people '
                      'never will: that the universe has a rhythm, and those who '
                      'align with it don\'t chase results — results chase them.'),

                  const SizedBox(height: 20),

                  _body(context,
                      'This is not a secret. It is ancient knowledge — practiced for '
                      'thousands of years by those who shaped empires, built dynasties, '
                      'and quietly moved the world. The moon was their clock. '
                      '"I AM" was their language. And commitment was their price.'),

                  const SizedBox(height: 20),

                  _body(context,
                      'Here is what they understood: manifestation is simple. '
                      'Not easy — simple. You declare what you are becoming. '
                      'You repeat it until your mind believes it. '
                      'You give thanks before you see proof. '
                      'And then you let go. Completely.'),

                  const SizedBox(height: 20),

                  _body(context,
                      'Most people fail because they won\'t commit to the process. '
                      'They want the result without the discipline. They manifest '
                      'for a day, check for signs, and quit when nothing happens by Tuesday. '
                      'That is not manifestation. That is wishing.'),

                  const SizedBox(height: 40),

                  // ── THE MOON ──
                  _heading(context, 'The Moon Is the Missing Piece'),

                  const SizedBox(height: 16),

                  _body(context,
                      'You\'ve probably tried affirmations before. You\'ve probably said '
                      '"I am abundant" in the mirror and felt nothing change. '
                      'That\'s because you were speaking into dead air — no timing, '
                      'no structure, no cosmic alignment behind your words.'),

                  const SizedBox(height: 20),

                  _body(context,
                      'The moon changes everything. It gives your practice a cycle — '
                      'a beginning, a middle, a peak, and a release. When you set '
                      'intentions at the new moon, you\'re not just writing wishes. '
                      'You\'re planting seeds in the only soil that has been moving '
                      'oceans since before humans existed.'),

                  const SizedBox(height: 20),

                  _body(context,
                      'The waning moon is not a pause. It is the most demanding phase of all. '
                      'Anyone can ask. Anyone can repeat. But to release — to truly let go '
                      'and trust that what you planted is growing in darkness — '
                      'that requires the discipline this practice was built on.'),

                  const SizedBox(height: 40),

                  // ── THE FOUR PHASES ──
                  _heading(context, 'The Four Sacred Phases'),

                  const SizedBox(height: 16),

                  _phaseDescription(context, MoonPhase.newMoon, 0.0,
                      'The Planting',
                      'In darkness, you name what you need — not what you want, '
                      'but what your soul requires. The new moon holds space for raw truth.'),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.waxing, 0.5,
                      'The Tending',
                      'As light returns, you repeat your intentions daily. '
                      'Not as hope, but as certainty. You are not asking — you are remembering '
                      'what is already on its way.'),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.fullMoon, 1.0,
                      'The Gratitude',
                      'At full illumination, you give thanks as though you already hold '
                      'what you asked for. This is not pretending. This is the act '
                      'that collapses the distance between where you are and where you are going.'),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.waning, 0.5,
                      'The Release',
                      'And then — silence. You let go. You stop pushing, stop checking, '
                      'stop asking. The waning moon teaches the hardest lesson: '
                      'that your work is done, and now it belongs to something larger than you.'),

                  const SizedBox(height: 40),

                  // ── CLOSING ──
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

  Widget _phaseDescription(BuildContext context, MoonPhase phase,
      double illumination, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: MoonPhaseIndicator(
              illumination: illumination, phase: phase, size: 32),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontFamily: 'CormorantGaramond',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 4),
              Text(description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.7,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}

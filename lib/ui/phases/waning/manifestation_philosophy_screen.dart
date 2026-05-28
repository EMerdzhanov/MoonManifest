import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/notifications/notification_service.dart';
import 'package:moon_manifest/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    try {
      final scheduledDate = tz.TZDateTime.from(nextNewMoon, tz.local)
          .subtract(const Duration(hours: 1));
      final now = tz.TZDateTime.now(tz.local);

      if (scheduledDate.isBefore(now)) return;

      await NotificationService.plugin.zonedSchedule(
        3000,
        l10n.philosophyNotificationTitle,
        l10n.philosophyNotificationBody,
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
          SnackBar(content: Text(l10n.philosophyCouldNotSchedule)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                state.nextNewMoon.difference(ref.read(moonPhaseEngineProvider).now).inDays;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // -- WHY THE WINDOW IS CLOSED --
                  Center(
                    child: Text(
                      l10n.philosophyTitle,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 24),

                  _body(context, l10n.philosophyBody1),
                  const SizedBox(height: 16),
                  _body(context, l10n.philosophyBody2),
                  const SizedBox(height: 16),
                  _body(context, l10n.philosophyBody3),

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
                            l10n.philosophyDaysUntilOpen,
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
                                          l10n.philosophyReminderSetFor(dateStr),
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
                                        Text(l10n.philosophyRemindMe),
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

                  // -- Divider --
                  Center(
                    child: Container(
                      width: 40,
                      height: 1,
                      color: AppColors.textMuted.withValues(alpha: 0.3),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // -- THE HOOK --
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
                      l10n.philosophyHookTitle,
                      style:
                          Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: AppColors.textPrimary,
                                height: 1.3,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  _body(context, l10n.philosophyHookBody1),
                  const SizedBox(height: 20),
                  _body(context, l10n.philosophyHookBody2),
                  const SizedBox(height: 20),
                  _body(context, l10n.philosophyHookBody3),
                  const SizedBox(height: 20),
                  _body(context, l10n.philosophyHookBody4),

                  const SizedBox(height: 40),

                  // -- THE MOON --
                  _heading(context, l10n.philosophyMoonHeading),
                  const SizedBox(height: 16),
                  _body(context, l10n.philosophyMoonBody1),
                  const SizedBox(height: 20),
                  _body(context, l10n.philosophyMoonBody2),
                  const SizedBox(height: 20),
                  _body(context, l10n.philosophyMoonBody3),

                  const SizedBox(height: 40),

                  // -- THE FOUR PHASES --
                  _heading(context, l10n.philosophyFourPhasesHeading),
                  const SizedBox(height: 16),

                  _phaseDescription(context, MoonPhase.newMoon, 0.0,
                      l10n.philosophyPhasePlanting,
                      l10n.philosophyPhasePlantingDesc),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.waxing, 0.5,
                      l10n.philosophyPhaseTending,
                      l10n.philosophyPhaseTendingDesc),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.fullMoon, 1.0,
                      l10n.philosophyPhaseGratitude,
                      l10n.philosophyPhaseGratitudeDesc),
                  const SizedBox(height: 20),

                  _phaseDescription(context, MoonPhase.waning, 0.5,
                      l10n.philosophyPhaseRelease,
                      l10n.philosophyPhaseReleaseDesc),

                  const SizedBox(height: 40),

                  // -- CLOSING --
                  Center(
                    child: Text(
                      l10n.philosophyClosing,
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

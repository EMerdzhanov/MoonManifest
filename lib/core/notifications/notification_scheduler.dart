import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'notification_service.dart';

class NotificationScheduler {
  static const _channelId = 'moon_manifest_intentions';
  static const _channelName = 'Intention Reminders';
  static const _channelDescription =
      'Daily intention reminders during waxing phase';
  static const _maxScheduleDays = 7; // iOS 64-notification limit workaround

  static Future<void> reschedule({
    required MoonPhase phase,
    required List<String> intentions,
    required int hour0,
    required int minute0,
    required int hour1,
    required int minute1,
    required int frequency,
  }) async {
    final plugin = NotificationService.plugin;
    await plugin.cancelAll();

    switch (phase) {
      case MoonPhase.newMoon:
      case MoonPhase.fullMoon:
        break; // Zero notifications
      case MoonPhase.waxing:
        await _scheduleWaxingNotifications(
          intentions: intentions,
          wakeStartHour: hour0,
          wakeStartMinute: minute0,
          wakeEndHour: hour1,
          wakeEndMinute: minute1,
          frequency: frequency,
        );
        break;
      case MoonPhase.waning:
        await _scheduleWaningNotification();
        break;
    }
  }

  static Future<void> _scheduleWaxingNotifications({
    required List<String> intentions,
    required int wakeStartHour,
    required int wakeStartMinute,
    required int wakeEndHour,
    required int wakeEndMinute,
    required int frequency,
  }) async {
    if (intentions.isEmpty) return;
    final plugin = NotificationService.plugin;
    final now = tz.TZDateTime.now(tz.local);

    final times = _distributeTimes(
        wakeStartHour, wakeStartMinute, wakeEndHour, wakeEndMinute, frequency);
    var notificationId = 1000;
    var intentionIndex = 0;

    for (var day = 0; day < _maxScheduleDays; day++) {
      for (final (hour, minute) in times) {
        var scheduledDate = tz.TZDateTime(
            tz.local, now.year, now.month, now.day + day, hour, minute);
        if (scheduledDate.isBefore(now)) continue;

        final intentionText = intentions[intentionIndex % intentions.length];
        intentionIndex++;

        await plugin.zonedSchedule(
          notificationId++,
          intentionText,
          null,
          scheduledDate,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _channelId,
              _channelName,
              channelDescription: _channelDescription,
              importance: Importance.defaultImportance,
              priority: Priority.defaultPriority,
              styleInformation: BigTextStyleInformation(intentionText),
            ),
            iOS: const DarwinNotificationDetails(
                presentAlert: true, presentSound: true),
          ),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    }
  }

  static Future<void> _scheduleWaningNotification() async {
    final plugin = NotificationService.plugin;
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = now.add(const Duration(minutes: 1));

    await plugin.zonedSchedule(
      2000,
      'Release. Trust. The work is done.',
      null,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  static List<(int hour, int minute)> _distributeTimes(
    int startHour,
    int startMinute,
    int endHour,
    int endMinute,
    int count,
  ) {
    final startMinutes = startHour * 60 + startMinute;
    final endMinutes = endHour * 60 + endMinute;
    final windowMinutes = endMinutes - startMinutes;

    if (count <= 1) {
      final mid = startMinutes + windowMinutes ~/ 2;
      return [(mid ~/ 60, mid % 60)];
    }

    final step = windowMinutes / (count - 1);
    return List.generate(count, (i) {
      final minuteOfDay = (startMinutes + step * i).round();
      return (minuteOfDay ~/ 60, minuteOfDay % 60);
    });
  }
}

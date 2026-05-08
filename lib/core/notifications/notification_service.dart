import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  static FlutterLocalNotificationsPlugin get plugin => _plugin;

  static Future<void> initialize() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    // Set local timezone. On iOS/Android the device timezone name is available
    // via DateTime.now().timeZoneName, but the tz database uses IANA names.
    // Fall back to UTC if the device timezone isn't found.
    try {
      final localTz = tz.getLocation(DateTime.now().timeZoneName);
      tz.setLocalLocation(localTz);
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: false,
      requestSoundPermission: true,
    );
    const settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _plugin.initialize(settings);
    _initialized = true;
  }

  static Future<bool> requestPermissions() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) await android.requestNotificationsPermission();

    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      await ios.requestPermissions(alert: true, badge: false, sound: true);
    }

    return true;
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    try {
      return const NotificationDetails(
        android: AndroidNotificationDetails(
          "uniqueId",
          "channelUnique",
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails(),
      );
    } catch (e) {
      print("error in init: $e");
    }
  }

  static Future<void> init() async {
    try {
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const ios = DarwinInitializationSettings();
      const settings = InitializationSettings(android: android, iOS: ios);
      await _notifications.initialize(
        settings,
        onDidReceiveNotificationResponse: (details) {
          onNotifications.add(details.payload);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  static void showScheduledNotification(
    int id,
    String title,
    String payload,
    DateTime dateTime,
  ) async {
    try {
      // _notifications.zonedSchedule(id, title, body, scheduledDate, notificationDetails, uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation)
      _notifications.zonedSchedule(
        id,
        title,
        "you need to accomplish $title task",
        tz.TZDateTime.from(
          dateTime,
          tz.local,
        ),
        await _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      print("error: $e");
    }
  }

  static void cancelScheduledNotification(
    int id,
  ) async {
    try {
      _notifications.cancel(id);
    } catch (e) {
      print("error: $e");
    }
  }
}

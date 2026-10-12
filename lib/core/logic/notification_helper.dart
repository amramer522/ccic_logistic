import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  final localNotify = FlutterLocalNotificationsPlugin();


  Future<void> init() async {
    await localNotify.initialize(
      settings: InitializationSettings(
        android: AndroidInitializationSettings("@drawable/ic_notify"),
      ),
    );
    await localNotify
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  void show(String title ,String body) {
    localNotify.show(
      id: 1,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          "general",
          "General",
          color: Color(0xff0c3e0b),
          icon: '@drawable/ic_notify',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}

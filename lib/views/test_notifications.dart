import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TestNotificationsView extends StatefulWidget {
  const TestNotificationsView({super.key});

  @override
  State<TestNotificationsView> createState() => _TestNotificationsViewState();
}

class _TestNotificationsViewState extends State<TestNotificationsView> {
  final localNotify = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    await localNotify.initialize(settings: InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_notify")
    ));
    await localNotify
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          localNotify.show(
            id: 1,
            title: "Hello",
            body: "How are you?",
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
        },
        child: Icon(Icons.notifications),
      ),
    );
  }
}

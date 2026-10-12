import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lottie/lottie.dart';

import '../core/logic/notification_helper.dart';

class TestNotificationsView extends StatefulWidget {
  const TestNotificationsView({super.key});

  @override
  State<TestNotificationsView> createState() => _TestNotificationsViewState();
}

class _TestNotificationsViewState extends State<TestNotificationsView>
    with SingleTickerProviderStateMixin {
  final helper = NotificationHelper();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    helper.init();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('Click animationController.isCompleted ${animationController.isCompleted}');
            if(animationController.isCompleted)
              {
                animationController.reverse();
              }else
                {
                  animationController.forward();
                }



          },
          child: Lottie.asset(
            'assets/lotties/switch.json',
            controller: animationController,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          helper.show("Hello", "How are you?");
        },
        child: Icon(Icons.notifications),
      ),
    );
  }
}

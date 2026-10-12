import 'dart:async';

import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo({required Widget page, bool keepHistory = true, int? seconds}) {
  void action() {
    Navigator.of(navKey.currentContext!).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => keepHistory,
    );
  }

  if (seconds == null) {
    action();
  } else {
    Timer(Duration(seconds: seconds), () {
      action();
    });
  }
}

void showMsg(String msg) {
  ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(msg, style: TextStyle(fontSize: 20)),
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16),
      showCloseIcon: true,
    ),
  );
}

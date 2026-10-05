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

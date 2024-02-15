import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notification_case/product/notification_service.dart';

/// CounterViewModel
final class CounterViewModel extends ChangeNotifier {
  /// CounterViewModel Constructor
  CounterViewModel(this.notificationService);

  /// Notification Service
  final INotificationService notificationService;

  /// Show Notification
  Future<void> showNotification(String title, String icon) async {
    await notificationService.showNotification(
      title,
      icon,
    );
  }

  int _counter = 15;

  final _password = '1234';

  /// Password Getter
  String get password => _password;

  /// Counter Getter
  int get counter => _counter;

  late Timer _timer;

  /// Timer Getter
  Timer get timer => _timer;

  /// Start Timer
  Future<void> startTimer() async {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }

        notifyListeners();
      },
    );
  }

  /// Check Password
  bool checkPassword(String value) {
    return value == _password;
  }

  /// Reset Timer
  void resetTimer() {
    _counter = 15;
    notifyListeners();
  }
}

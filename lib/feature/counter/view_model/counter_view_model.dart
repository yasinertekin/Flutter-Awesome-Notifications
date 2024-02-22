import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notification_case/product/notification_service.dart';

/// CounterViewModel
final class CounterViewModel extends ChangeNotifier {
  /// CounterViewModel Constructor
  CounterViewModel(this.notificationService);

  /// Notification Service
  final INotificationService notificationService;

  int _counter = 15;

  /// Counter Getter
  int get counter => _counter;
  late Timer _timer;

  /// Timer Getter
  Timer get timer => _timer;

  bool _isCracked = false;

  /// Is Cracked Getter
  bool get isCracked => _isCracked;

  void _setIsCracked() {
    _isCracked = !_isCracked;
    notifyListeners();
  }

  /// Start Timer
  Future<void> startTimer(String password) async {
    _setIsCracked();

    const duration = Duration(milliseconds: 250);
    _timer = Timer.periodic(
      duration,
      (timer) {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
          notificationService.showNotification(
            'Password Cracked!',
            'Password: $password',
          );
        }
        notifyListeners();
      },
    );
    _setIsCracked();
    notifyListeners();
  }

  /// Reset Timer
  void resetTimer() {
    _counter = 15;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

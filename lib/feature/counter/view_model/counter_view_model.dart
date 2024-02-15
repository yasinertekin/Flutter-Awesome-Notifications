import 'dart:async';

import 'package:flutter/material.dart';

/// CounterViewModel
final class CounterViewModel extends ChangeNotifier {
  int _counter = 15;

  bool _isTimerFinished = true;

  final _password = '1234';

  /// Password Getter
  String get password => _password;

  /// Is Timer Finished Getter
  bool get isTimerFinished => _isTimerFinished;

  /// Counter Getter
  int get counter => _counter;

  late Timer _timer;

  /// Timer Getter
  Timer get timer => _timer;

  /// Start Timer
  Future<void> startTimer() async {
    _isTimerFinished = false;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          _isTimerFinished = false;
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
    _isTimerFinished = true;
    notifyListeners();
  }
}

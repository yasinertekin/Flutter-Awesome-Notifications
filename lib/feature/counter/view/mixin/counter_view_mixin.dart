import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/counter_view.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';

/// CounterViewMixin
mixin CounterViewMixin on State<CounterView> {
  final _controller = TextEditingController();

  final int _randomKey = Random().nextInt(1000);

  /// Random Key Getter
  int get randomKey => _randomKey;

  /// Controller Getter
  TextEditingController get controller => _controller;

  /// Form Key
  final _formKey = GlobalKey<FormState>();

  /// Form Key Getter
  GlobalKey<FormState> get formKey => _formKey;

  final _password = '1234';

  /// Password Getter
  String get password => _password;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// Check Password
  bool checkPassword(String value, String password) {
    return value == password;
  }

  /// Crack Password
  void crackPassword(CounterViewModel counterViewModel) {
    _crackPassword(
      counterViewModel,
    );
  }

  Future<void> _crackPassword(CounterViewModel counterViewModel) async {
    if (formKey.currentState?.validate() ?? false) {
      final value = controller.text;
      if (checkPassword(value, password)) {
        await counterViewModel.startTimer();

        await counterViewModel.notificationService.scheduledNotification(
          DateTime.now().add(
            Duration(seconds: counterViewModel.counter),
          ),
          Random().nextInt(100).toString(),
          'Password is cracked!',
          'icon',
        );
        counterViewModel.resetTimer();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong Password!'),
          ),
        );
      }
    }
  }
}

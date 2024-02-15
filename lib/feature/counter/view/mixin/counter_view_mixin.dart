import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/counter_view.dart';

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
}

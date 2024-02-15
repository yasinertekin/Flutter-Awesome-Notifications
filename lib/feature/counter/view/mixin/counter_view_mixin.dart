import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/counter_view.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';

/// CounterViewMixin
mixin CounterViewMixin on State<CounterView> {
  final _counterViewModel = CounterViewModel();

  final _controller = TextEditingController();

  final int _randomKey = Random().nextInt(1000);

  /// Random Key Getter
  int get randomKey => _randomKey;

  /// Controller Getter
  TextEditingController get controller => _controller;

  /// CounterViewModel Getter
  CounterViewModel get counterViewModel => _counterViewModel;

  /// Form Key
  final _formKey = GlobalKey<FormState>();

  /// Form Key Getter
  GlobalKey<FormState> get formKey => _formKey;

  /// Counter Getter
  int get counter => _counterViewModel.counter;

  @override
  void dispose() {
    _counterViewModel.timer.cancel();
    super.dispose();
  }

  /// Start Timer
  void startTimer() {
    _counterViewModel.startTimer();
  }

  /// Start Timer And Bottom Sheet
  void customShowModalBottomSheet(
    CounterViewModel counterViewModel,
    int randomKey,
  ) {}

  /// Show Scaffold Messenger
  void showScaffoldMessenger(String message) {}
}

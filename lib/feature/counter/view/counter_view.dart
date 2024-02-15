import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/mixin/counter_view_mixin.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

part 'widget/counter_text_field.dart';
part 'widget/enter_password_button.dart';

/// CounterView
final class CounterView extends StatefulWidget {
  /// CounterView Constructor
  const CounterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CounterAppState createState() => _CounterAppState();
}

final class _CounterAppState extends State<CounterView> with CounterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterViewModel>(
      builder: (context, counterViewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Countdown Timer'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Password: ${counterViewModel.password}'),
                  const SizedBox(height: 16),
                  _CounterTextField(
                    controller: controller,
                  ),
                  const SizedBox(height: 16),
                  _EnterPasswordButton(
                    () async {
                      if (formKey.currentState?.validate() ?? false) {
                        final value = controller.text;
                        if (counterViewModel.checkPassword(value)) {
                          await counterViewModel.startTimer();

                          await counterViewModel.notificationService
                              .scheduledNotification(
                            DateTime.now().add(
                              Duration(seconds: counterViewModel.counter),
                            ),
                            Random().nextInt(100).toString(),
                            'Password is cracked!',
                            'icon',
                          );
                          counterViewModel.resetTimer();
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${counterViewModel.counter}',
                    style: const TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void showScaffoldMessenger(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

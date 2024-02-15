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
        body: _CounterViewBody(
          formKey: formKey,
          password: password,
          controller: controller,
          onPressed: () async {
            crackPassword(counterViewModel);
          },
          counterViewModel: counterViewModel,
        ),
      ),
    );
  }
}

final class _CounterViewBody extends StatelessWidget {
  const _CounterViewBody({
    required this.formKey,
    required this.password,
    required this.controller,
    required this.counterViewModel,
    required this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final String password;
  final TextEditingController controller;
  final CounterViewModel counterViewModel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Password: $password'),
              const SizedBox(height: 16),
              _CounterTextField(
                controller: controller,
              ),
              _EnterPasswordButton(
                onPressed,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Text(
                '${counterViewModel.counter}',
                style: const TextStyle(fontSize: 48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

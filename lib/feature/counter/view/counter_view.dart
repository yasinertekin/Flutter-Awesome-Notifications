import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/mixin/counter_view_mixin.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';

part 'widget/bottom_sheet_container.dart';
part 'widget/counter_text_field.dart';
part 'widget/enter_password_button.dart';
part 'widget/password_deciphering.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: ListenableBuilder(
              listenable: counterViewModel,
              builder: (context, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!counterViewModel.isTimerFinished)
                    const _PasswordDeciphering()
                  else
                    const SizedBox.shrink(),
                  Text('Password: ${counterViewModel.password}'),
                  const SizedBox(height: 16),
                  _CounterTextField(
                    controller: controller,
                  ),
                  const SizedBox(height: 16),
                  _EnterPasswordButton(
                    () async {
                      await _startTimerAndBottomSheet();
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$counter',
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

  Future<void> _startTimerAndBottomSheet() async {
    if (formKey.currentState?.validate() ?? false) {
      final value = controller.text;
      if (counterViewModel.checkPassword(value)) {
        await counterViewModel.startTimer();

        Future.delayed(
          Duration(seconds: counterViewModel.counter),
          () => customShowModalBottomSheet(
            counterViewModel,
            randomKey,
          ),
        );
        showScaffoldMessenger('Password is correct!');
      } else {
        showScaffoldMessenger('Password is incorrect!');
      }
    }
  }

  @override
  Future<void> customShowModalBottomSheet(
    CounterViewModel counterViewModel,
    int randomKey,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 1), () {
          showScaffoldMessenger('Password is cracked!');
          counterViewModel.resetTimer();
          Navigator.of(context).pop(); // Close the bottom sheet after 1 seconds
        });
        return _BottomSheetContainer(
          randomKey: randomKey.toString(),
        );
      },
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

import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/mixin/counter_view_mixin.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

part 'widget/counter_app_bar.dart';
part 'widget/custom_alert_dialog.dart';
part 'widget/password_cracking_view.dart';
part 'widget/password_text_form_field.dart';

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
      builder: (context, counterViewModel, child) {
        navigateDecrypteView(counterViewModel, context);
        return _CounterBody(
          counterViewModel,
        );
      },
    );
  }

  @override
  Future<void> showAlertDialog() {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          controller: controller,
          password: password,
          formKey: formKey,
          crackPassword: crackPassword,
        );
      },
    );
  }
}

final class _CounterBody extends StatelessWidget {
  const _CounterBody(
    this.counterViewModel,
  );

  final CounterViewModel counterViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _CounterAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (counterViewModel.isCracked)
              const SizedBox.shrink()
            else
              _PasswordCrackingView(
                password: counterViewModel.counter.toString(),
              ),
          ],
        ),
      ),
    );
  }
}

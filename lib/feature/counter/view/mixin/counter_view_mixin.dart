import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/counter_view.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';
import 'package:notification_case/feature/decrypte/decrypte_view.dart';

/// CounterViewMixin
mixin CounterViewMixin on State<CounterView> {
  final _controller = TextEditingController();

  /// Controller Getter
  TextEditingController get controller => _controller;

  /// Form Key
  final _formKey = GlobalKey<FormState>();

  /// Form Key Getter
  GlobalKey<FormState> get formKey => _formKey;

  final _password = '1234';

  /// Password Getter
  String get password => _password;

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
        await counterViewModel.startTimer(
          password,
        );

        Navigator.pop(context);

        counterViewModel.resetTimer();
      }
    }
  }

  /// Show Model Bottom
  void showAlertDialog() {}
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return showAlertDialog();
    });
  }

  /// Navigate Decrypte View
  void navigateDecrypteView(
    CounterViewModel counterViewModel,
    BuildContext context,
  ) {
    if (counterViewModel.counter == 1) {
      Future.microtask(
        () => Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => const DecrypteView(),
          ),
        ),
      );
    }
  }
}

part of '../counter_view.dart';

/// Custom Alert Dialog Widget
final class CustomAlertDialog extends StatelessWidget {
  /// CustomAlertDialog Constructor
  const CustomAlertDialog({
    required this.controller,
    required this.password,
    required this.formKey,
    required this.crackPassword,
    super.key,
  });

  /// Controller
  final TextEditingController controller;

  /// Password
  final String password;

  /// Form Key
  final GlobalKey<FormState> formKey;

  /// Crack Password
  final void Function(CounterViewModel counterViewModel) crackPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text('Enter Password'),
        actions: [
          Column(
            children: [
              _PasswordTextFormField(
                controller: controller,
                password: password,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  crackPassword(context.read<CounterViewModel>());
                },
                child: const Text('Crack'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

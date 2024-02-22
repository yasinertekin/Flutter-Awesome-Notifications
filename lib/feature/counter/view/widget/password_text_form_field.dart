part of '../counter_view.dart';

final class _PasswordTextFormField extends StatefulWidget {
  const _PasswordTextFormField({
    required this.controller,
    required this.password,
  });

  final TextEditingController controller;
  final String password;

  @override
  State<_PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

final class _PasswordTextFormFieldState extends State<_PasswordTextFormField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        if (value != widget.password) {
          return 'Incorrect password';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}

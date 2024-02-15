part of '../counter_view.dart';

final class _CounterTextField extends StatefulWidget {
  const _CounterTextField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<_CounterTextField> createState() => _CounterTextFieldState();
}

final class _CounterTextFieldState extends State<_CounterTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Password',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        return null;
      },
    );
  }
}

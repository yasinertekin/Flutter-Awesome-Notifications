part of '../counter_view.dart';

final class _EnterPasswordButton extends StatelessWidget {
  const _EnterPasswordButton(
    this.onPressed,
  );

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'Start Deciphering Password',
        ),
      ),
    );
  }
}

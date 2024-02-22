part of '../counter_view.dart';

final class _PasswordCrackingView extends StatelessWidget {
  const _PasswordCrackingView({
    required this.password,
  });

  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Password Cracking...'),
        const SizedBox(
          height: 20,
        ),
        const CircularProgressIndicator(),
        const SizedBox(height: 20),
        Text(
          'You have $password seconds left',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

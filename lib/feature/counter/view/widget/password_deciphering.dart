part of '../counter_view.dart';

final class _PasswordDeciphering extends StatelessWidget {
  const _PasswordDeciphering();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Deciphering the password'),
        SizedBox(height: 16),
        CircularProgressIndicator(),
      ],
    );
  }
}

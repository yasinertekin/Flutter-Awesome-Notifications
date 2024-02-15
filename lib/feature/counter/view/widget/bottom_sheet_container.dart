part of '../counter_view.dart';

final class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer({
    required this.randomKey,
  });

  final String randomKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Text(
          'Random Key: $randomKey',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

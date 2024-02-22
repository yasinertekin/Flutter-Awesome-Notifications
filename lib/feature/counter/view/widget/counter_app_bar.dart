part of '../counter_view.dart';

final class _CounterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CounterAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Countdown Timer'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

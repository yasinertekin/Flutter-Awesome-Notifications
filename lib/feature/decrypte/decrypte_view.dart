import 'package:flutter/material.dart';
import 'package:notification_case/feature/counter/view/counter_view.dart';

/// DecrypteView
final class DecrypteView extends StatelessWidget {
  /// DecrypteView const
  const DecrypteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Decrypte'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _DecrypteButton(),
          ],
        ),
      ),
    );
  }
}

final class _DecrypteButton extends StatelessWidget {
  const _DecrypteButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => const CounterView(),
          ),
        );
      },
      child: const Text(
        'Decrypte',
      ),
    );
  }
}

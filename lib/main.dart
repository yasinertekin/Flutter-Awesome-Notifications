import 'package:flutter/material.dart';
import 'package:notification_case/feature/decrypte/decrypte_view.dart';
import 'package:notification_case/locators.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Locators.register(); // Locators sınıfındaki bağımlılıkları kaydet

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Locators.counterViewModel,
        ),
      ],
      child: const _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DecrypteView(),
    );
  }
}

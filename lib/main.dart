import 'package:clean_architecture/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Project',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      // home: const MyHomePage(),
    );
  }
}

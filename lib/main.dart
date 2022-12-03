import 'package:flutter/material.dart';
import 'view/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: const Color.fromRGBO(207, 253, 242, 0.9),
    ),
    home: const InitialScreen(),
    );
  }
}

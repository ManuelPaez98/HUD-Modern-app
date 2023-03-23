import 'package:flutter/material.dart';
import 'package:flutter_app_1/Pages/Conn.dart';
import 'package:flutter_app_1/Pages/Example.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ExmaplePage.route,
      routes: {
        //Todo agregar páginas
        ExmaplePage.route: (_) => const ExmaplePage(),
        TestConn.route: (_) => const TestConn(),
      },
    );
  }
}

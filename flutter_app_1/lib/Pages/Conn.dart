import 'dart:io';
import 'package:flutter/material.dart';

//! Funcion de activar script Python
Future<void> ejecutarScript() async {
  final resultado = await Process.run('python3', [
    '/home/manuel/Desktop/Flutter_Projects/Prueba/flutter_app_1/lib/Scripts Python/server.py'
  ]);
  print(resultado.stdout);
  print(resultado.stderr);
}

class TestConn extends StatefulWidget {
  const TestConn({super.key});

  static const String route = "/Test_Conn";
  @override
  State<TestConn> createState() => _TestConnState();
}

class _TestConnState extends State<TestConn> {
  @override
  Widget build(BuildContext context) {
    return const MaterialButton(
      onPressed: ejecutarScript,
      minWidth: 130,
      height: 40,
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      color: Color(0xF04B39EF),
      child: Text(
        'Update',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );
  }
}

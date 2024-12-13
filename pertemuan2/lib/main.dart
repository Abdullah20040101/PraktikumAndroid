import 'package:flutter/material.dart';
import 'package:praktikum02/checkbox02.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Widget',
      home: Checkbox02(),
    );
  }
}

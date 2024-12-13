import 'package:flutter/material.dart';
import 'studikasus04.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Praktikum03',
      home: Studikasus04(),
    );
  }
}

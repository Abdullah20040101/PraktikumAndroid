import 'package:flutter/material.dart';
import 'kolom.dart';
import 'baris.dart';
import 'kotak.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 01',
      home: Kotak(),
    ); // MaterialApp
  }
}

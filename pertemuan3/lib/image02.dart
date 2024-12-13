import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/html.png'), // Gambar 1
            Image.asset('assets/css.png'), // Gambar 2
            Image.asset('assets/js.png'), // Gambar 3
            Image.asset('assets/flutter.jpg'), // Gambar 4
          ],
        ),
      ),
    );
  }
}

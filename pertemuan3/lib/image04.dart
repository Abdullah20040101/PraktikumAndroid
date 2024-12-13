import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/en/thumb/5/50/Hashirama_Senju.png/220px-Hashirama_Senju.png'),
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/en/thumb/4/4b/Tobirama_Senju.png/220px-Tobirama_Senju.png'),
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Minato_Namikaze.png/220px-Minato_Namikaze.png'),
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/en/3/32/Hiruzen_Sarutobi.png'),
            buildImageCard(
                'https://upload.wikimedia.org/wikipedia/en/e/eb/Tsunade_Senju.png'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 150.0,
          width: double.infinity,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Container(
              height: 150.0,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Gagal memuat gambar',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Studikasus04 extends StatefulWidget {
  const Studikasus04({super.key});

  @override
  State<Studikasus04> createState() => _Studikasus04State();
}

class _Studikasus04State extends State<Studikasus04> {
  String? _pilihan;
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image dan Radiobutton'),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: const Text('Hokage 1'),
              value: 'Hokage 1',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png';
                });
              }),
          RadioListTile(
              title: const Text('Hokage 2'),
              value: 'Hokage 2',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://upload.wikimedia.org/wikipedia/id/b/be/Tobirama_Senju.png';
                });
              }),
          RadioListTile(
              title: const Text('Hokage 3'),
              value: 'Hokage 3',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/113/2023/11/08/Alasan-Utama-Sarutobi-Hiruzen-dibenci-fans-Naruto-3971855199.jpg';
                });
              }),
          RadioListTile(
              title: const Text('Hokage 4'),
              value: 'Hokage 4',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://cdn.idntimes.com/content-images/community/2021/07/hokage-minato-cropped-56965fbaa68adf470a17cc45ea5d328d-88cca1df70c39740743b65d213c40fcb_600x400.png';
                });
              }),
          RadioListTile(
              title: const Text('Hokage 5'),
              value: 'Hokage 5',
              groupValue: _pilihan,
              onChanged: (value) {
                setState(() {
                  _pilihan = value;
                  url =
                      'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg';
                });
              }),    
          Text(
            'Pilihan Kami $_pilihan',
            style: const TextStyle(fontSize: 20),
          ),
          buildImageCard(url),
        ],
      ),
    );
  }
}

// Fungsi untuk membangun kotak gambar
Widget buildImageCard(String imageUrl) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Sudut melengkung
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
        height: 150.0, // Tinggi kontainer
        width: double.infinity, // Lebar penuh
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Center(child: Text('Gagal memuat gambar'));
        },
      ),
    ),
  );
}

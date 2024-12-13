import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  const StudiKasus03({super.key});

  @override
  _StudiKasus03State createState() => _StudiKasus03State();
}

class _StudiKasus03State extends State<StudiKasus03> {
  String? selectedHokage;
  String? imageUrl;

  // Map untuk mencocokkan Hokage dengan URL gambar mereka
  final Map<String, String> hokageImages = {
    'Hokage 1':
        'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png',
    'Hokage 2':
        'https://upload.wikimedia.org/wikipedia/id/b/be/Tobirama_Senju.png',
    'Hokage 3':
        'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/113/2023/11/08/Alasan-Utama-Sarutobi-Hiruzen-dibenci-fans-Naruto-3971855199.jpg',
    'Hokage 4':
        'https://cdn.idntimes.com/content-images/community/2021/07/hokage-minato-cropped-56965fbaa68adf470a17cc45ea5d328d-88cca1df70c39740743b65d213c40fcb_600x400.png',
    'Hokage 5':
        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/10/23/934786489.jpg',
  };

  void loadImage() {
    setState(() {
      if (selectedHokage != null) {
        imageUrl = hokageImages[selectedHokage];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studi Kasus 03'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Hokage'),
              value: selectedHokage,
              onChanged: (String? value) {
                setState(() {
                  selectedHokage = value;
                });
              },
              items: hokageImages.keys
                  .map<DropdownMenuItem<String>>((String hokage) {
                return DropdownMenuItem<String>(
                  value: hokage,
                  child: Text(hokage),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                loadImage();
              },
              child: const Text('Load Image'),
            ),
            const SizedBox(height: 16.0),
            if (imageUrl != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
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
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(child: Text('Gagal memuat gambar'));
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

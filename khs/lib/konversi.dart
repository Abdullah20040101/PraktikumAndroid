// main.dart
import 'package:flutter/material.dart';
import 'konversi.dart'; // Menghubungkan dengan file konversi.dart

void main() {
  runApp(MaterialApp(
    home: GradeInputPage(),
  ));
}

class Konversi {
  final indeksPrestrasiSemester = (nilai) {
    if (nilai >= 0 && nilai <= 2.5) {
      return 'Tidak Memuaskan';
    } else if (nilai >= 2.6 && nilai < 3.0) {
      return 'Memuaskan';
    } else if (nilai >= 3.1 && nilai <= 3.5) {
      return 'Sangat Memuaskan';
    } else {
      return 'Dengan Pujian';
    }
  };

  final sksMatkul = (grade) {
    if (grade == 'E') {
      return 0;
    } else if (grade == 'D') {
      return 1;
    } else if (grade == 'C') {
      return 1.5;
    } else if (grade == 'C+') {
      return 2;
    } else if (grade == 'B') {
      return 3;
    } else if (grade == 'B+') {
      return 3.5;
    } else {
      return 4;
    }
  };

  final totalSKS = () {
    return 23;
  };
}

class GradeInputPage extends StatefulWidget {
  @override
  _GradeInputPageState createState() => _GradeInputPageState();
}

class _GradeInputPageState extends State<GradeInputPage> {
  final List<String> grades = ['A', 'B', 'C', 'D', 'E'];
  final Map<int, String> selectedGrades = {};

  void calculateAndNavigate() {
    int totalSKS = 23; // Set total SKS sesuai kebutuhan
    double totalPoints = 0;

    selectedGrades.forEach((index, grade) {
      int gradePoint;
      switch (grade) {
        case 'A':
          gradePoint = 4;
          break;
        case 'B':
          gradePoint = 3;
          break;
        case 'C':
          gradePoint = 2;
          break;
        case 'D':
          gradePoint = 1;
          break;
        case 'E':
          gradePoint = 0;
          break;
        default:
          gradePoint = 0;
      }
      totalPoints +=
          gradePoint * 3; // Asumsikan setiap mata kuliah memiliki 3 SKS
    });

    double ipk = totalPoints / totalSKS;
    String kategori = Konversi().indeksPrestrasiSemester(ipk);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultPage(totalSKS: totalSKS, ipk: ipk, kategori: kategori),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Nilai Mata Kuliah')),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Mata Kuliah ${index + 1}'),
            subtitle: DropdownButton<String>(
              value: selectedGrades[index],
              hint: Text('Pilih Nilai'),
              items: grades.map((grade) {
                return DropdownMenuItem<String>(
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGrades[index] = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Hitung'),
        onPressed: calculateAndNavigate,
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int totalSKS;
  final double ipk;
  final String kategori;

  ResultPage(
      {required this.totalSKS, required this.ipk, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hasil Perhitungan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total SKS: $totalSKS', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('IPK: ${ipk.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Kategori: $kategori', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

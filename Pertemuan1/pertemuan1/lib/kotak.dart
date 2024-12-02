import 'package:flutter/material.dart';

class Kotak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Belajar Kolom'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100,
            color: Colors.amber,
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            color: Colors.brown,
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            color: Colors.purple,
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            color: Colors.tealAccent,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Studikasus01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Column, Row, and Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scroll Demo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.list, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Daftar Anggota',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('Anggota $i'),
                  subtitle: Text('Informasi tentang anggota $i'),
                  leading: Icon(Icons.person),
                )
            ],
          ),
        ),
      ),
    );
  }
}

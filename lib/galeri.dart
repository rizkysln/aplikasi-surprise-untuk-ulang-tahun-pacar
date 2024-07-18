import 'package:flutter/material.dart';

class GaleriKenanganPage extends StatelessWidget {
  // Daftar asset paths gambar
  final List<String> _gambarAssetPaths = [
    'assets/gambar/gambar1.jpg',
    'assets/gambar/gambar2.jpg',
    'assets/gambar/gambar3.jpg',
    // Tambahkan asset path gambar lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri Kenangan'),
      ),
      body: ListView.builder(
        itemCount: _gambarAssetPaths.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0), // Batas tepi setiap gambar
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2), // Warna dan lebar batas tepi
              borderRadius: BorderRadius.circular(10), // Membuat batas tepi melengkung
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Membuat gambar melengkung sesuai batas tepi
              child: Image.asset(
                _gambarAssetPaths[index], // Mengambil gambar dari asset path
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

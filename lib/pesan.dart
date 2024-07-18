import 'package:flutter/material.dart';

class PesanRomantisPage extends StatelessWidget {
  // Daftar pesan romantis
  final List<String> _pesanRomantis = [
    'Kamu adalah alasanku tersenyum setiap hari.',
    'Setiap detik bersamamu adalah anugerah yang tak ternilai.',
    'Aku mencintaimu lebih dari yang bisa aku ungkapkan dengan kata-kata.',
    'Bersamamu, aku menemukan arti kebahagiaan yang sebenarnya.',
    'Kamu adalah bintang terang dalam hidupku yang gelap.',
    'Aku bersyukur setiap hari karena memilikimu di sisiku.',
    'Cintamu adalah kekuatan yang membuatku terus maju.',
    'Kamu adalah segalanya bagiku, sekarang dan selamanya.',
    'Aku mencintaimu lebih dari kemarin, tapi tidak sebanyak esok hari.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Romantis'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // Ganti dengan path gambar yang Anda miliki
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _pesanRomantis.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Tambahkan opasitas untuk membuat teks lebih mudah dibaca
                border: Border.all(color: Colors.pink, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  _pesanRomantis[index],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

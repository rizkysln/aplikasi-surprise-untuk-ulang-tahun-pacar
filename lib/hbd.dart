import 'package:flutter/material.dart';

class UcapanUlangTahunPage extends StatelessWidget {
  // Daftar ucapan ulang tahun
  final List<String> _ucapanUlangTahun = [
    'Selamat ulang tahun! Semoga tahun ini penuh dengan kebahagiaan dan cinta.',
    'Hari ini adalah hari istimewa karena kamu lahir. Selamat ulang tahun!',
    'Semoga ulang tahunmu dipenuhi dengan tawa dan kebahagiaan.',
    'Selamat ulang tahun! Semoga semua impianmu menjadi kenyataan.',
    'Hari ini adalah hari yang spesial untuk seseorang yang luar biasa. Selamat ulang tahun!',
    'Semoga ulang tahunmu membawa sukacita, cinta, dan keberuntungan sepanjang tahun.',
    'Selamat ulang tahun! Terima kasih telah menjadi bagian dari hidupku.',
    'Di hari ulang tahunmu ini, aku berharap kamu mendapatkan semua yang terbaik dalam hidup.',
    'Selamat ulang tahun! Semoga hari-harimu ke depan penuh dengan kebahagiaan dan kesuksesan.',
    'Ucapan terhangat di hari ulang tahunmu. Semoga kamu selalu diberkati dengan kebahagiaan dan cinta.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ucapan Ulang Tahun'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _ucapanUlangTahun.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  _ucapanUlangTahun[index],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

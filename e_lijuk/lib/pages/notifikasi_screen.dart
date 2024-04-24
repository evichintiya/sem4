import 'package:e_lijuk/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  bool _obscureText = true;

  // Contoh list notifikasi (ganti dengan data notifikasi yang sesuai)
  List<NotifikasiItem> notifikasiList = [
    NotifikasiItem(
      fotoProfil: 'assets/img/foto_profil.jpg',
      nominalPembayaran: 'Rp 100.000',
      deskripsiJumlah: 'Anda memiliki tagihan sebesar Rp 100.000 untuk pembelian paket 1.',
    ),
    NotifikasiItem(
      fotoProfil: 'assets/img/foto_profil.jpg',
      nominalPembayaran: 'Rp 150.000',
      deskripsiJumlah: 'Anda memiliki tagihan sebesar Rp 150.000 untuk pembelian paket 2.',
    ),
    NotifikasiItem(
      fotoProfil: 'assets/img/foto_profil.jpg',
      nominalPembayaran: 'Rp 75.000',
      deskripsiJumlah: 'Anda memiliki tagihan sebesar Rp 75.000 untuk pembelian paket 3.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/Background.png'), // Sesuaikan dengan path gambar yang benar
                fit: BoxFit.cover,
              ),
            ),
          ),
          toolbarHeight: 60,
          title: Text(
            'Notifikasi',
            style: GoogleFonts.dmSans(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColor.hijau22,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/Background.png'), // Sesuaikan dengan path gambar yang benar
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10), // Memberikan jarak dengan AppBar
            itemCount: notifikasiList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(notifikasiList[index].fotoProfil),
                ),
                title: Text(
                  'Nominal Pembayaran: ${notifikasiList[index].nominalPembayaran}',
                  style: GoogleFonts.dmSans(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            )
                ),
                subtitle: Text(
                  notifikasiList[index].deskripsiJumlah,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.normal, // Atur gaya font sesuai keinginan Anda
                    color: Colors.black54, // Atur warna sesuai keinginan Anda
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NotifikasiItem {
  final String fotoProfil;
  final String nominalPembayaran;
  final String deskripsiJumlah;

  NotifikasiItem({
    required this.fotoProfil,
    required this.nominalPembayaran,
    required this.deskripsiJumlah,
  });
}

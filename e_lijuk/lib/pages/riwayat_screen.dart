import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatPemesanan extends StatefulWidget {
  const RiwayatPemesanan({Key? key}) : super(key: key);

  @override
  _RiwayatPemesananState createState() => _RiwayatPemesananState();
}

class _RiwayatPemesananState extends State<RiwayatPemesanan> {
  // Contoh list riwayat pemesanan
  List<RiwayatItem> riwayatList = [
    RiwayatItem(
      namaPemesan: 'John Doe',
      status: 'Sedang Diproses',
      deskripsi: 'Pesanan Anda sedang diproses.',
      tanggal: '3 April 2024',
      waktu: '15:30',
      nomorTelepon: '',
      fotoPaket: '',
      totalPemesanan: '',
    ),
    RiwayatItem(
      namaPemesan: 'Jane Smith',
      status: 'Sudah Dikonfirmasi',
      deskripsi:
          'Anda memiliki tagihan sebesar Rp 150.000 untuk pembelian paket 2.',
      tanggal: '2 April 2024',
      waktu: '10:45',
      nomorTelepon: '',
      fotoPaket: '',
      totalPemesanan: '',
    ),
    RiwayatItem(
      namaPemesan: 'Michael Johnson',
      status: 'Ditolak',
      deskripsi: 'Pesanan Anda telah ditolak.',
      tanggal: '1 April 2024',
      waktu: '08:20',
      nomorTelepon: '',
      fotoPaket: '',
      totalPemesanan: '',
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
          toolbarHeight: 60,
          title: Text(
            'Riwayat Pemesanan',
            style: GoogleFonts.dmSans(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0, left: 0, right: 0),
            itemCount: riwayatList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  // Navigasi ke halaman detail riwayat dengan mengirim data riwayat yang dipilih
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailRiwayat(riwayat: riwayatList[index]),
                    ),
                  );
                  // Handle result jika diperlukan
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 0),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                    leading: CircleAvatar(
                      backgroundColor: riwayatList[index].status ==
                              'Sedang Diproses'
                          ? Colors.yellow
                          : riwayatList[index].status == 'Sudah Dikonfirmasi'
                              ? Colors.green
                              : riwayatList[index].status == 'Ditolak'
                                  ? Colors.red
                                  : Colors.grey,
                      child: Icon(
                        riwayatList[index].status == 'Sedang Diproses'
                            ? Icons.timer
                            : riwayatList[index].status == 'Sudah Dikonfirmasi'
                                ? Icons.check_circle
                                : riwayatList[index].status == 'Ditolak'
                                    ? Icons.cancel
                                    : Icons.error_outline,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Nama Pemesan: ${riwayatList[index].namaPemesan}',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status: ${riwayatList[index].status}',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Deskripsi: ${riwayatList[index].deskripsi}',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
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

class RiwayatItem {
  final String namaPemesan;
  final String status;
  final String deskripsi;
  final String tanggal;
  final String waktu;
  final String nomorTelepon;
  final String fotoPaket; // Tambahkan properti untuk foto paket
  final String totalPemesanan; // Tambahkan properti untuk total pemesanan

  RiwayatItem({
    required this.namaPemesan,
    required this.status,
    required this.deskripsi,
    required this.tanggal,
    required this.waktu,
    required this.nomorTelepon,
    required this.fotoPaket,
    required this.totalPemesanan,
  });
}

class DetailRiwayat extends StatelessWidget {
  final RiwayatItem riwayat;

  const DetailRiwayat({Key? key, required this.riwayat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            leading: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            toolbarHeight: 100,
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Detail Riwayat',
                style: GoogleFonts.dmSans(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.green,
            centerTitle: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              Container(
                height: 350, // Ubah tinggi kotak gambar sesuai kebutuhan
                width: double.infinity,
                child: Image.asset(
                  'assets/img/paket.png',
                  fit: BoxFit.cover, // Menyesuaikan gambar ke dalam kotak
                ),
              ),
              SizedBox(height: 20), // Spasi antara gambar dan teks
              // Informasi pemesanan
              Text(
                'Nama Pemesan: ${riwayat.namaPemesan}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nomor Telepon: ${riwayat.nomorTelepon}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Tanggal Pemesanan: ${riwayat.tanggal}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Waktu Pemesanan: ${riwayat.waktu}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Status: ${riwayat.status}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Deskripsi: ${riwayat.deskripsi}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Total Pemesanan: ${riwayat.totalPemesanan}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(35.0),
          child: ElevatedButton(
            onPressed: () {
              // Your onPressed function here for left button
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 30,
              ),
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            child: Text(
              'Batalkan Pemesanan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

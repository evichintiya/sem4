import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rincian extends StatefulWidget {
  const Rincian({Key? key}) : super(key: key);

  @override
  State<Rincian> createState() => _RincianState();
}

class _RincianState extends State<Rincian> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(
            leading: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30), // Sesuaikan dengan tinggi yang diinginkan
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            toolbarHeight: 100, // Sesuaikan dengan tinggi yang diinginkan
            title: Padding(
              padding: EdgeInsets.only(top: 3), // Sesuaikan padding atas
              child: Text(
                'Rincian Pemesanan',
                style: GoogleFonts.dmSans(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.green, // Sesuaikan dengan warna yang diinginkan
            centerTitle: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), // Sesuaikan radius sesuai keinginan
                bottomRight: Radius.circular(30), // Sesuaikan radius sesuai keinginan
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Furi Wardatus Sa\'adah',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+6285707427246',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'SMA',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'x50',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Paket 1',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Waktu Pemesanan',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '10.00-12.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Tanggal Pemesanan',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '29-04-2024',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Pemesanan',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp 100.000',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Your onPressed function here for left button
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    backgroundColor: Colors.red, // Change to desired color
                    textStyle: TextStyle(
                      fontSize: 16,
                    ), // Change to desired size
                  ),
                  child: Text(
                    'Batalkan Pemesanan',
                    style: TextStyle(color: Colors.white).copyWith(
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_lijuk/pages/notifikasi_screen.dart';
import 'package:e_lijuk/pages/rincianpemesanan_screen.dart';
import 'package:e_lijuk/pages/riwayat_screen.dart';
import 'package:e_lijuk/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:e_lijuk/pages/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
     
    );
  }
}

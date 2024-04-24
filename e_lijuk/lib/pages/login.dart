import 'dart:convert';
import 'package:d_method/d_method.dart';
import 'package:e_lijuk/pages/beranda_screen.dart';
import 'package:e_lijuk/pages/register_screen.dart';
import 'package:e_lijuk/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController kataSandiController = TextEditingController();
  final TextEditingController namaPenggunaController = TextEditingController();

static Future<void> loginUser(
  String username, String password, BuildContext context) async {
    final apiUrl = 'http://192.168.100.17/laravelssem4/mobile/login.php';

    DMethod.log('on login method');
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'nama_pengguna': username,
          'kata_sandi': password,
        },
      );

      DMethod.log('after response');

      if (response.statusCode == 200) {
        DMethod.log('login berhasil');

        // Dekode respons JSON
        final responseData = json.decode(response.body);
        
        // Periksa status pesan dari respons
        if (responseData['status'] == 'success') {
          // Login berhasil
          // DMethod.log('login berhasil');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BerandaPage(),
            ),
          );
        } else {
          // Login gagal
          DMethod.log('login gagal: ${responseData['message']}');
          showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Gagal'),
              content: Text(responseData['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        }
        

      } else {
        DMethod.log('login gagal');
        // Tangani kesalahan jika ada
        throw Exception('Gagal melakukan request: ${response.statusCode}');
      }
    } catch (error) {
      DMethod.log('on error');
      // Tangani kesalahan jaringan
      throw Exception('Kesalahan jaringan: $error');
    }
}


  Future<void> _login() async {
    try {
      final String apiUrl =
          'http://192.168.1.4/laravelssem4/mobile/login.php'; // Ganti dengan alamat API login Anda
      final response = await http.post(Uri.parse(apiUrl), body: {
        'nama_pengguna': namaPenggunaController.text,
        'katasandi': kataSandiController.text,
      });

      final responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        // Navigasi ke halaman setelah login berhasil
       
      } else {
        // Tampilkan pesan kesalahan jika login gagal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Gagal'),
              content: Text(responseData['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Backround gambar
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/Background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Additional image on top
            Positioned(
              top: 120, // Adjust top position as needed
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/img/taman.png',
                  width: 300, // Adjust width as needed
                  height: 300, // Adjust height as needed
                ),
              ),
            ),
            // Text widget
            Positioned(
              top: 70, // Adjust top position as needed
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        'DMSans-Regular', // Adding the fontFamily property
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Form
            Positioned(
              top: 425, // Adjust top position as needed
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Pengguna",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DMSans-Regular',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.abu1, // Assuming this color is defined correctly
                      ),
                      child: TextField(
                        controller: namaPenggunaController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person), // Icon added here
                          hintText: 'Nama pengguna',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          border: InputBorder.none, // No border
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Kata Sandi",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DMSans-Regular',
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.abu1, // Assuming this color is defined correctly
                      ),
                      child: TextField(
                        controller: kataSandiController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock), // Icon added here
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          hintText: 'Kata sandi',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          border: InputBorder.none, // No border
                        ),
                        obscureText: _obscureText,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontFamily: 'DMSans-Italic'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.hijau22
                        ),
                        onPressed: () async {
                          try {
                            await loginUser(namaPenggunaController.text,
                                kataSandiController.text, context);
                          } catch (ex) {
                            print("ERROR : $ex");
                          }
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'DMSans-Regular',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 19),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.putih1,
                        ),
                        onPressed: () {
                          // Add your Google login logic here
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/icon/icon_google.png"), // Corrected icon usage
                            SizedBox(width: 10),
                            Text(
                              "Masuk dengan Google",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.hitam1,
                                fontFamily: 'DMSans-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Moved SizedBox here
                    Row(
                      // Moved Row here
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.abu2,
                              fontFamily: 'DMSans-Regular'),
                        ),
                        TextButton(
                          // Corrected TextButton here
                          onPressed: () {
                            print('Tombol ditekan!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'Daftar Disini',
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'DMSans-Regular'),
                          ),
                        ),
                      ],
                    ),
                  ], // Moved closing bracket here
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
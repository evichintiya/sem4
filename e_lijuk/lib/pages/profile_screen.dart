import 'package:e_lijuk/pages/login.dart';
import 'package:e_lijuk/pages/notifikasi_screen.dart';
import 'package:e_lijuk/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _obscureText = true;
  Uint8List? _image;
  File? imageSelected;

  Future<void> updateUsername(String newUsername) async {
    final response = await http.post(
      Uri.parse('http://192.168.137.65/laravelssem4/mobile/editprofil.php'),
      body: {'new_username': newUsername},
    );

    if (response.statusCode == 200) {
      // Handle response from the server
      print('Username updated successfully');
    } else {
      // Handle errors
      print('Failed to update username');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset:
            false, // Add this line to prevent the background from moving
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
                image: AssetImage(
                    'assets/img/Background.png'), // Sesuaikan dengan path gambar yang benar
                fit: BoxFit.cover,
              ),
            ),
          ),
          toolbarHeight: 60,
          title: Text(
            'Profil',
            style: GoogleFonts.dmSans(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColor.hijau22,
          centerTitle: true,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/Background.png',
                  ), // Sesuaikan dengan path gambar yang benar
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 30, // Sesuaikan dengan posisi vertikal yang diinginkan
                  left: 0, // Sesuaikan dengan posisi horizontal yang diinginkan
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: InkWell(
                        onTap: () {
                          _showSheet(context);
                        },
                        child: _image != null
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 50,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200, // Adjust top position as needed
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Pengguna",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.abu1,
                        // Change color to appropriate one
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          // Icon added here
                          hintText: 'Furijk_97',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          border: InputBorder.none,
                          // Remove border
                        ),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.abu1,
                        // Change color to appropriate one
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          // Change icon to appropriate one
                          hintText: 'example@example.com',
                          // Change hint text to appropriate one
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          border: InputBorder.none,
                          // Remove border
                        ),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Kata Sandi",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.abu1,
                        // Change color to appropriate one
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          // Icon added here
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
                          hintText: 'Jungko0k_1997',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          border: InputBorder.none,
                          // Remove border
                        ),
                        obscureText: _obscureText,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Your onPressed function here for left button
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5, // Atur tinggi sesuai kebutuhan
                                horizontal: 60, // Atur lebar sesuai kebutuhan
                              ),
                              backgroundColor:
                                  AppColor.hijau22, // Change to desired color
                              textStyle: TextStyle(
                                fontSize: 16,
                              ), // Change to desired size
                            ),
                            child: Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white).copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                          ),

                          SizedBox(height: 5), // Spacer
                          ElevatedButton(
                            onPressed: () {
                              showLogoutConfirmationDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 5, // Atur tinggi sesuai kebutuhan
                                horizontal: 60, // Atur lebar sesuai kebutuhan
                              ),
                              backgroundColor:
                                  AppColor.merah1, // Change to desired color
                              textStyle: TextStyle(
                                fontSize: 16,
                              ), // Change to desired size
                            ),
                            child: Text(
                              'Keluar',
                              style: TextStyle(color: Colors.white).copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => _pickPhoto(ImageSource.camera),
                backgroundColor: Colors.black,
                heroTag: 'camera',
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              FloatingActionButton(
                onPressed: () => _pickPhoto(ImageSource.gallery),
                backgroundColor: Colors.purple,
                heroTag: 'galery',
                child: const Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              _image != null
                  ? FloatingActionButton(
                      onPressed: () {
                        setState(() => _image = null);
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blueGrey,
                      heroTag: 'delete',
                      child: const Icon(
                        Icons.delete_outlined,
                        color: Colors.white,
                      ),
                    )
                  : const Material(),
            ],
          ),
        );
      },
    );
  }

  Future _pickPhoto(ImageSource imageSource) async {
    // Logger().i('from photo');
    final returnImage = await ImagePicker().pickImage(source: imageSource);

    if (returnImage != null) {
      setState(() {
        imageSelected = File(returnImage.path);
        _image = File(returnImage.path).readAsBytesSync();
      });
    } else {
      return null;
    }

    Navigator.pop(context);
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Keluar"),
        content: Text("Apakah kamu yakin ingin keluar?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text(
              "Tidak",
              // style,
            ),
          ),
          TextButton(
            onPressed: () {
              // Perform logout action here
              Navigator.pushReplacement(
                // Use pushReplacement to prevent going back to the previous screen
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Iya"),
          ),
        ],
      );
    },
  );
}

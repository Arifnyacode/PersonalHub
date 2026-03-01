import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfile());
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Profil'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menambahkan widget Icon
              const Icon(Icons.account_circle, size: 100, color: Colors.pink),
              //menambahkan widget Text
              const Text(
                'Nama: Arif Rahmadhani',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // widget deskripsi
              const Text(
                'Saya seorang pengembang aplikasi Flutter yang antusias dan bersemangat untuk belajar hal-hal baru dalam dunia pemrograman.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              //widget row untuk menampilkan email dan nomor telepon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('arif.rahmadhani@example.com'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('+62 812-3456-7890'),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Kembali ke Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

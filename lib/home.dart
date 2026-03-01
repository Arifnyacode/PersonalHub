import 'package:flutter/material.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> daftarkegiatan = [
    "Beli makan siang",
    "Bayar listrik",
    "Bayar uang kas sekolah",
    "Beli pulsa",
    "Bensin motor",
    "Beli kuota internet",
    "Menabung",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Keuangan'),
        backgroundColor: Colors.indigo,
        leading: const Icon(Icons.account_balance_wallet),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Aksi saat ikon profil ditekan (misalnya, navigasi ke halaman profil)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfile()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarkegiatan.length, // Jumlah item dalam daftar kegiatan
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0 ? Colors.blue : Colors.green,
                child: const Icon(Icons.monetization_on, color: Colors.white),
              ),
              title: Text(daftarkegiatan[index]), // Menampilkan nama kegiatan
              subtitle: const Text('Hari ini'), // Deskripsi singkat
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                print(
                  "Anda mengklik kegiatan: ${daftarkegiatan[index]}",
                ); // Aksi ketika item diklik (misalnya, navigasi ke detail kegiatan)
              },
            ),
          );
        },
      ),
    );
  }
}

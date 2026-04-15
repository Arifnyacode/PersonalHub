import 'package:flutter/material.dart';
import 'package:personalhub/add_activity.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        leading: const Icon(Icons.account_balance_wallet, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Aksi saat tombol delete ditekan
                      print("Hapus kegiatan: ${daftarkegiatan[index]}");
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      // Aksi saat tombol edit ditekan
                      print("Edit kegiatan: ${daftarkegiatan[index]}");
                    },
                  ),
                ],
              ),

              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Kegiatan Diklik'),
                      content: Text(
                        "Anda mengklik kegiatan: ${daftarkegiatan[index]}",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                ); // Aksi ketika item diklik (misalnya, navigasi ke detail kegiatan)
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke halaman input kegiatan dan menunggu hasilnya
          final hasilDariInput = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddActivity()),
          );

          // Setelah kembali dari halaman input, periksa apakah ada hasil yang valid
          if (hasilDariInput != null && hasilDariInput['kegiatan'] != null) {
            setState(() {
              daftarkegiatan.add(hasilDariInput['kegiatan']);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Kegiatan '${hasilDariInput['kegiatan']}' berhasil ditambahkan!",
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

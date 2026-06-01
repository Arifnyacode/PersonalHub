import 'package:flutter/material.dart';
import 'add_activity.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  //1. data ketegori yang akan ditampilkan
  final List<Map<String, dynamic>> daftarKategori = [
    {"kategori": "Makanan", "icon": Icons.restaurant, "warna": Colors.orange},
    {
      "kategori": "Transportasi",
      "icon": Icons.directions_car,
      "warna": Colors.blue,
    },
    {"kategori": "Hiburan", "icon": Icons.movie, "warna": Colors.purple},
    {"kategori": "Tagihan", "icon": Icons.receipt_long, "warna": Colors.red},
    {"kategori": "Belanja", "icon": Icons.shopping_cart, "warna": Colors.green},
    {"kategori": "Pemasukan", "icon": Icons.savings, "warna": Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilihan Kategori Transaksi'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // 2. implementasi gridview builder
        child: GridView.builder(
          itemCount: daftarKategori.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            mainAxisSpacing: 12, // Jarak vertikal antar item
            crossAxisSpacing: 12, // Jarak horizontal antar item
            childAspectRatio:
                1.1, // Rasio aspek untuk membuat item berbentuk kotak
          ),
          itemBuilder: (context, index) {
            final item = daftarKategori[index];
            return InkWell(
              onTap: () {
                //3. aksi saat kategori dipilih, akan diarahkan ke halaman tambah kegiatan dengan membawa data kategori yang dipilih
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddActivity(kategoriPilihan: item['kategori']),
                  ),
                ).then((dataBaru) {
                  //4. menangkap data baru yang dikirim dari halaman tambah kegiatan dan mengembalikannya ke halaman home
                  if (dataBaru != null) {
                    Navigator.pop(
                      context,
                      dataBaru,
                    ); // Mengirim data baru kembali ke halaman home
                  }
                });
              },
              child: Card(
                color: item['warna'].withOpacity(0.15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: item['warna'], width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: item['warna'],
                      child: Icon(item['icon'], color: Colors.white, size: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['kategori'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

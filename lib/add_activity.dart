import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final TextEditingController _controllerKegiatan = TextEditingController();

  @override
  void dispose() {
    _controllerKegiatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Kegiatan')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerKegiatan,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                hintText: "Contoh: Beli Buku",
                border:
                    OutlineInputBorder(), // Menambahkan border pada TextField
                prefixIcon: Icon(
                  Icons.edit,
                ), // Menambahkan ikon di dalam TextField
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                // logika tombol ditekan
                if (_controllerKegiatan.text.isEmpty) {
                  // Tampilkan pesan error jika input kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama kegiatan tidak boleh kosong'),
                    ),
                  );
                } else {
                  // ambil data dan kembali ke halaman sebelumnya
                  String namaKegiatan = _controllerKegiatan.text;
                  print(
                    "Data Tersimpan: $namaKegiatan",
                  ); // Contoh menyimpan data (bisa diganti dengan logika penyimpanan yang sebenarnya)
                  Navigator.pop(
                    context,
                    namaKegiatan,
                  ); // Kembali ke halaman sebelumnya dengan data
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

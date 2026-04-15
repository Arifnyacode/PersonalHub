import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  final TextEditingController _controllerKegiatan = TextEditingController();
  final TextEditingController _controllerJumlah = TextEditingController();

  @override
  void dispose() {
    _controllerKegiatan.dispose();
    _controllerJumlah.dispose();
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                // Menambahkan border pada TextField
                prefixIcon: Icon(
                  Icons.edit,
                  color: Colors.indigo,
                ), // Menambahkan ikon di dalam TextField
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controllerJumlah,
              decoration: const InputDecoration(
                labelText: 'Jumlah',
                hintText: "Contoh: 5",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                prefixIcon: Icon(Icons.money, color: Colors.indigo),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                // logika tombol ditekan
                if (_controllerKegiatan.text.isNotEmpty &&
                    _controllerJumlah.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'kegiatan': _controllerKegiatan.text,
                    'jumlah': int.tryParse(_controllerJumlah.text) ?? 0,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mohon isi semua field')),
                  );
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

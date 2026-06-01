import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  //tambahkan variabel untuk penerima constructor

  final String kategoriPilihan;

  const AddActivity({super.key, required this.kategoriPilihan});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Kategori: ${widget.kategoriPilihan}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                labelText: 'Nominal (Rp)',
                hintText: "Contoh: 50000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                prefixIcon: Icon(Icons.attach_money, color: Colors.indigo),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  // logika tombol ditekan
                  if (_controllerKegiatan.text.isNotEmpty &&
                      _controllerJumlah.text.isNotEmpty) {
                    Map<String, dynamic> newActivity = {
                      'kegiatan': _controllerKegiatan.text,
                      'nominal': int.tryParse(_controllerJumlah.text) ?? 0,
                      'kategori': widget.kategoriPilihan,
                    };
                    Navigator.pop(context, newActivity);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mohon isi semua field')),
                    );
                  }
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

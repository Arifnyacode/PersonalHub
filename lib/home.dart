import 'package:flutter/material.dart';
import 'package:personalhub/add_activity.dart';
import 'package:personalhub/calculate.dart';
import 'package:personalhub/category.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> daftarkegiatan = [
    {"kegiatan": "Beli makan siang", "nominal": 50000},
    {"kegiatan": "Bayar listrik", "nominal": 200000},
    {"kegiatan": "Bayar uang kas sekolah", "nominal": 100000},
    {"kegiatan": "Beli pulsa", "nominal": 50000},
    {"kegiatan": "Bensin motor", "nominal": 150000},
    {"kegiatan": "Beli kuota internet", "nominal": 100000},
    {"kegiatan": "Menabung", "nominal": 100000},
  ];

  void _aksiHapusKegiatan(int index) {
    setState(() {
      daftarkegiatan.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Kegiatan berhasil dihapus!"),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _aksiEditKegiatan(int index) {
    TextEditingController editController = TextEditingController(
      text: daftarkegiatan[index]['kegiatan'],
    );
    TextEditingController nominalController = TextEditingController(
      text: daftarkegiatan[index]['nominal'].toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Kegiatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editController,
                decoration: const InputDecoration(labelText: 'Nama Kegiatan'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nominalController,
                decoration: const InputDecoration(labelText: 'Nominal'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (editController.text.isNotEmpty &&
                    nominalController.text.isNotEmpty) {
                  setState(() {
                    daftarkegiatan[index] = {
                      'kegiatan': editController.text,
                      'nominal':
                          int.tryParse(nominalController.text) ??
                          daftarkegiatan[index]['nominal'],
                    };
                  });
                }

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Kegiatan berhasil diubah!"),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Keuangan'),
        backgroundColor: Colors.indigo,

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Menu Cash Flow',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            //pilihan menu 1 Dashboard
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),
            //pilihan menu 2 Hitung Cash Flow
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Hitung Pengeluaran'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CalculateScreen(dataKeuangan: daftarkegiatan),
                  ),
                );
              },
            ),
            //Pilihan menu 3 Profil
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()),
                );
              },
            ),
          ],
        ),
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
              title: Text(
                daftarkegiatan[index]['kegiatan'],
              ), // Menampilkan nama kegiatan
              subtitle: Text(
                'Nominal: Rp ${daftarkegiatan[index]['nominal']}',
              ), // Deskripsi singkat
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Aksi saat tombol delete ditekan
                      _aksiHapusKegiatan(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      // Aksi saat tombol edit ditekan
                      _aksiEditKegiatan(index);
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
            MaterialPageRoute(builder: (context) => CategoryScreen()),
          );

          // Setelah kembali dari halaman input, periksa apakah ada hasil yang valid
          if (hasilDariInput != null &&
              hasilDariInput['kegiatan'] != null &&
              hasilDariInput['nominal'] != null) {
            setState(() {
              daftarkegiatan.add(hasilDariInput);
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

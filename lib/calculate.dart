import 'package:flutter/material.dart';

class CalculateScreen extends StatelessWidget {
  // data kiriman dari home.dart akan diterima disini untuk diproses
  final List<Map<String, dynamic>> dataKeuangan;

  // Konstruktor untuk menerima data keuangan dari home.dart
  const CalculateScreen({super.key, required this.dataKeuangan});

  // Fungsi untuk menghitung total pengeluaran
  int hitungTotalPengeluaran() {
    int total = 0;
    for (var item in dataKeuangan) {
      total += item['nominal'] as int; // Pastikan nominal adalah int
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Total Pengeluaran'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate, size: 80, color: Colors.indigo),
            SizedBox(height: 20),
            Text(
              "Total pengeluaran Anda adalah: Rp. ${hitungTotalPengeluaran()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

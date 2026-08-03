import 'package:flutter/material.dart';

void main() {
  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int jumlahStok = 40;
  bool tersedia = true;

  debugPrint("=== KARTU DATA BARANG ===");
  debugPrint("Nama : $namaBarang");
  debugPrint("Harga Anggota : Rp$hargaAnggota");
  debugPrint("Harga Umum : Rp$hargaUmum");
  debugPrint("Stok : $jumlahStok");
  debugPrint("Tersedia : $tersedia");

  int jumlahBeli = 3;

  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  debugPrint("Total (anggota) $jumlahBeli pcs: Rp$totalAnggota");
  debugPrint("Selisih vs umum : Rp$selisih");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(187, 255, 0, 1),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Menjawab: Mengapa pemilihan tipe data pada program ini penting bagi
// keakuratan kasir koperasi?
// Pemilihan tipe data yang tepat memastikan setiap perhitungan (seperti
// total harga dan selisih) berjalan akurat sesuai sifat datanya 
// misalnya harga memakai double agar bisa menampung nilai desimal, sementara
// stok memakai int karena jumlah barang selalu bilangan bulat. Jika tipe data
// salah dipilih, misalnya harga disimpan sebagai String, maka perhitungan
// otomatis (seperti total = jumlah x harga) akan gagal atau menghasilkan
// error, sehingga kasir tidak bisa mendapatkan angka transaksi yang benar.
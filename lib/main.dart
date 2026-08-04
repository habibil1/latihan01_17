import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  var formatter = NumberFormat('#,###', 'id_ID');

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int jumlahStok = 0;

  bool tersedia;
  if (jumlahStok == 0) {
    tersedia = false;
  } else {
    tersedia = true;
  }

  debugPrint("=== KARTU DATA BARANG ===");
  debugPrint("Nama : $namaBarang");
  debugPrint("Harga Anggota : Rp${formatter.format(hargaAnggota)}");
  debugPrint("Harga Umum : Rp${formatter.format(hargaUmum)}");
  debugPrint("Stok : $jumlahStok");

  if (tersedia) {
    debugPrint("Status : Tersedia");
  } else {
    debugPrint("Status : Habis / Tidak Tersedia");
  }

  int jumlahBeli = 3;
  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  debugPrint("Total (anggota) $jumlahBeli pcs: Rp${formatter.format(totalAnggota)}");
  debugPrint("Selisih vs umum : Rp${formatter.format(selisih)}");

  bool anggota = true;
  int jumlahBeliKasir = 30;

  double hargaDipakai;
  if (anggota) {
    hargaDipakai = hargaAnggota;
  } else {
    hargaDipakai = hargaUmum;
  }

  double totalKasir = jumlahBeliKasir * hargaDipakai;

  double potongan;
  if (totalKasir > 200000) {
    potongan = totalKasir * 0.10;
  } else if (totalKasir > 100000) {
    potongan = totalKasir * 0.05;
  } else {
    potongan = 0;
  }

  double hargaAkhir = totalKasir - potongan;

  debugPrint("--- TRANSAKSI KASIR ---");
  debugPrint("Status Pembeli : ${anggota ? 'Anggota' : 'Umum'}");
  debugPrint("Jumlah Beli : $jumlahBeliKasir pcs");
  debugPrint("Harga Satuan : Rp${formatter.format(hargaDipakai)}");
  debugPrint("Total Sebelum Potongan : Rp${formatter.format(totalKasir)}");
  debugPrint("Potongan : Rp${formatter.format(potongan)}");
  debugPrint("Harga Akhir : Rp${formatter.format(hargaAkhir)}");



String kategori = "atk"; // ganti sesuai kategori barang: "atk", "makanan", "minuman"
String lokasiRak;

switch (kategori) {
  case "atk":
    lokasiRak = "Rak 1";
    break;
  case "makanan":
    lokasiRak = "Rak 2";
    break;
  case "minuman":
    lokasiRak = "Rak 3";
    break;
  default:
    lokasiRak = "Rak lain";
}

debugPrint("Kategori : $kategori");
debugPrint("Lokasi : $lokasiRak");

// Mengapa switch case lebih rapi dibanding banyak if di sini?
// Karena switch case membandingkan SATU variabel (kategori) dengan 
// beberapa kemungkinan nilai yang sudah pasti/tetap (atk, makanan, minuman), 
// sehingga strukturnya lebih ringkas dan mudah dibaca dibanding menulis 
// banyak if-else berantai (if kategori == "atk" ... else if kategori == 
// "makanan" ... dst). Switch-case juga lebih jelas menunjukkan bahwa ini 
// adalah pengecekan nilai yang sama terhadap banyak kemungkinan, bukan 
// pengecekan kondisi yang berbeda-beda seperti pada if biasa.

debugPrint("Kategori : $kategori");
  debugPrint("Lokasi : $lokasiRak");

  // (kode komentar switch-case kamu tetap di sini, tidak diubah)

  // ===== UJI 3 SKENARIO (Tabel C) =====
  debugPrint("\n=== UJI SKENARIO ===");

  // Skenario (a): Anggota, total 250.000
  bool ujiAnggotaA = true;
  double ujiTotalA = 250000;
  double ujiPotonganA;
  if (ujiTotalA > 200000) {
    ujiPotonganA = ujiTotalA * 0.10;
  } else if (ujiTotalA > 100000) {
    ujiPotonganA = ujiTotalA * 0.05;
  } else {
    ujiPotonganA = 0;
  }
  double ujiHargaAkhirA = ujiTotalA - ujiPotonganA;

  debugPrint(
    "(a) ${ujiAnggotaA ? 'anggota' : 'umum'}, total ${formatter.format(ujiTotalA)} "
    "Harga: ${ujiAnggotaA ? 'anggota' : 'umum'} "
    "Potongan borongan: 10% "
    "Harga akhir: Rp${ujiHargaAkhirA} Kategori: $lokasiRak"
  );

  // Skenario (b): Umum, total 150.000
  bool ujiAnggotaB = false;
  double ujiTotalB = 150000;
  double ujiPotonganB;
  if (ujiTotalB > 200000) {
    ujiPotonganB = ujiTotalB * 0.10;
  } else if (ujiTotalB > 100000) {
    ujiPotonganB = ujiTotalB * 0.05;
  } else {
    ujiPotonganB = 0;
  }
  double ujiHargaAkhirB = ujiTotalB - ujiPotonganB;

  debugPrint(
    "(b) ${ujiAnggotaB ? 'anggota' : 'umum'}, total ${formatter.format(ujiTotalB)} "
    "Potongan borongan: 5% Harga akhir: Rp$ujiHargaAkhirB"
  );

  // Skenario (c): Umum, total 50.000
  bool ujiAnggotaC = false;
  double ujiTotalC = 50000;
  double ujiPotonganC;
  if (ujiTotalC > 200000) {
    ujiPotonganC = ujiTotalC * 0.10;
  } else if (ujiTotalC > 100000) {
    ujiPotonganC = ujiTotalC * 0.05;
  } else {
    ujiPotonganC = 0;
  }
  double ujiHargaAkhirC = ujiTotalC - ujiPotonganC;

  debugPrint(
    "(c) ${ujiAnggotaC ? 'anggota' : 'umum'}, total ${formatter.format(ujiTotalC)} "
    "Potongan borongan: tanpa potongan Harga akhir: Rp$ujiHargaAkhirC"
  );

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
// total harga dan selisih) berjalan akurat sesuai sifat datanya masing-masing —
// misalnya harga memakai double agar bisa menampung nilai desimal, sementara
// stok memakai int karena jumlah barang selalu bilangan bulat. Jika tipe data
// salah dipilih, misalnya harga disimpan sebagai String, maka perhitungan
// otomatis (seperti total = jumlah x harga) akan gagal atau menghasilkan
// error, sehingga kasir tidak bisa mendapatkan angka transaksi yang benar.

// Referensi: Package intl (pub.dev/packages/intl) — kelas NumberFormat
// digunakan untuk memformat angka dengan pemisah ribuan sesuai locale
// tertentu, di sini menggunakan locale 'id_ID' agar formatnya sesuai
// standar Indonesia (titik sebagai pemisah ribuan).
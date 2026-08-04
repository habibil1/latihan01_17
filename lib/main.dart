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
  // ===== Aturan baru: anggota dengan total > 500rb dapat potongan 15% =====
  // Kondisi ini WAJIB dicek paling awal, sebelum aturan 10% dan 5%,
  // supaya transaksi anggota bertotal besar tidak "kejebak" di aturan lama.
  if (anggota && totalKasir > 500000) {
    potongan = totalKasir * 0.15;
  } else if (totalKasir > 200000) {
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


  debugPrint("\n=== UJI SKENARIO ===");

  bool ujiAnggotaA = true;
  double ujiTotalA = 250000;
  double ujiPotonganA;
  if (ujiAnggotaA && ujiTotalA > 500000) {
    ujiPotonganA = ujiTotalA * 0.15;
  } else if (ujiTotalA > 200000) {
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

  bool ujiAnggotaB = false;
  double ujiTotalB = 150000;
  double ujiPotonganB;
  if (ujiAnggotaB && ujiTotalB > 500000) {
    ujiPotonganB = ujiTotalB * 0.15;
  } else if (ujiTotalB > 200000) {
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

  bool ujiAnggotaC = false;
  double ujiTotalC = 50000;
  double ujiPotonganC;
  if (ujiAnggotaC && ujiTotalC > 500000) {
    ujiPotonganC = ujiTotalC * 0.15;
  } else if (ujiTotalC > 200000) {
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

  debugPrint("\n=== UJI ATURAN BARU (15% anggota >500rb) ===");

  bool uji1Anggota = true;
  double uji1Total = 600000;
  double uji1Potongan;
  if (uji1Anggota && uji1Total > 500000) {
    uji1Potongan = uji1Total * 0.15;
  } else if (uji1Total > 200000) {
    uji1Potongan = uji1Total * 0.10;
  } else if (uji1Total > 100000) {
    uji1Potongan = uji1Total * 0.05;
  } else {
    uji1Potongan = 0;
  }
  debugPrint("Anggota, total 600.000 -> Potongan: ${uji1Potongan / uji1Total * 100}% (harus 15%)");

  bool uji2Anggota = false;
  double uji2Total = 600000;
  double uji2Potongan;
  if (uji2Anggota && uji2Total > 500000) {
    uji2Potongan = uji2Total * 0.15;
  } else if (uji2Total > 200000) {
    uji2Potongan = uji2Total * 0.10;
  } else if (uji2Total > 100000) {
    uji2Potongan = uji2Total * 0.05;
  } else {
    uji2Potongan = 0;
  }
  debugPrint("Umum, total 600.000 -> Potongan: ${uji2Potongan / uji2Total * 100}% (harus tetap 10%, aturan lama)");

  bool uji3Anggota = true;
  double uji3Total = 250000;
  double uji3Potongan;
  if (uji3Anggota && uji3Total > 500000) {
    uji3Potongan = uji3Total * 0.15;
  } else if (uji3Total > 200000) {
    uji3Potongan = uji3Total * 0.10;
  } else if (uji3Total > 100000) {
    uji3Potongan = uji3Total * 0.05;
  } else {
    uji3Potongan = 0;
  }
  debugPrint("Anggota, total 250.000 -> Potongan: ${uji3Potongan / uji3Total * 100}% (harus tetap 10%, aturan lama)");


debugPrint("\n=== DAFTAR BARANG ===");

List<String> namaBarangList = ["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
List<double> hargaBarangList = [3000, 2500, 1500, 5000];

for (int i = 0; i < namaBarangList.length; i++) {
  int nomor = i + 1;
  debugPrint("$nomor. ${namaBarangList[i]} - Rp. ${formatter.format(hargaBarangList[i])}");
}


debugPrint("\n--- Penjualan Buku Tulis ---");

int stokBukuTulis = 3;

while (stokBukuTulis > 0) {
  stokBukuTulis = stokBukuTulis - 1;
  debugPrint("Terjual 1, sisa stok: $stokBukuTulis");
}


// Bahaya apa yang muncul bila kondisi berhenti pada while keliru, dan
// bagaimana cara memastikan koperasi tidak menjual melebihi stok?
// Jika kondisi while salah — misalnya ditulis "while (stokBukuTulis >= 0)"
// alih-alih "while (stokBukuTulis > 0)" — maka program akan tetap masuk
// ke dalam loop saat stok sudah 0, sehingga stok bisa berkurang menjadi
// minus (-1, -2, dst). Ini berbahaya karena secara nyata artinya koperasi
// "menjual" barang yang sebenarnya sudah habis, yang bisa membuat data
// stok tidak akurat dan berpotensi menyebabkan kekecewaan pembeli karena
// barang yang dibeli sebenarnya tidak ada.
// Untuk memastikan koperasi tidak menjual melebihi stok, kondisi while
// harus tepat menggunakan "> 0" (bukan ">= 0"), dan pengurangan stok
// harus dilakukan SEBELUM stok ditampilkan/dicatat sebagai terjual,
// sehingga perulangan otomatis berhenti begitu stok mencapai tepat 0,
// tidak pernah melewatinya menjadi negatif

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo coy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(187, 255, 0, 1),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo coy'),
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
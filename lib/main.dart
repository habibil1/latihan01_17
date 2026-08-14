import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Barang {
  String nama;
  double harga;
  int _stok;

  Barang(this.nama, this.harga, int stok1) : _stok = stok1;

  int get stok => _stok;

  double nilaiStok() {
    return harga * _stok;
  }

  bool bisaDijual(int diminta) {
    return diminta <= _stok;
  }

  bool jual(int n) {
    if (n <= 0) {
      debugPrint("transaksi gagal: jaumlah beli harus lebih dari 0");
      return false;
    }

    if (n <= _stok) {
      _stok -= n;
      debugPrint("berhasil: $n $nama terjual. Sisa stok: $_stok");
      return true;
    } else {
      debugPrint("gagal: Stok $nama tidak cukup (minta: $n, Stok: $_stok)");
      return false;
    }
  }

  void tampilkan() {
    debugPrint("=== kartru barang ===");
    debugPrint("Nama       : $nama");
    debugPrint("Harga      : Rp $harga");
    debugPrint("Stok       : $_stok");
    debugPrint("Nilai Stok : Rp ${nilaiStok()}");
    debugPrint("");
  }

  void prosesBeli(String tiga) {
    try {
      int jumlah = int.parse(tiga);
      jual(jumlah);
    } catch (e) {
      debugPrint("\"$tiga\" bukan angka, silahkan masukkan angka yang benar.");
    } finally {
      debugPrint("transaksi dicatat di log.");
    }
  }
}

class Pembeli {
  String nama;
  bool statusAnggota;

  Pembeli(this.nama, this.statusAnggota);

  void tampilkan() {
    debugPrint("=== DATA PEMBELI ===");
    debugPrint("Nama : $nama");
    debugPrint("Status : ${statusAnggota ? 'Anggota' : 'Umum'}");
    debugPrint("");
  }
}

double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

double hitungHarga(bool anggota, double hAnggota, double hUmum) {
  if (anggota) {
    return hAnggota;
  } else {
    return hUmum;
  }
}

double bayarAkhir(int jumlah, double harga, double persenPotongan) {
  double total = hitungTotal(jumlah, harga);
  double hargaAkhir = hitungHargaAkhir(total, persenPotongan);
  return hargaAkhir;
}

class BarangPromo extends Barang {
  double persenDiskon;

  BarangPromo(String nama, double harga, int stok, this.persenDiskon)
      : super(nama, harga, stok);

  double hargaSetelahDiskon() {
    return harga - (harga * persenDiskon / 100);
  }
}

Future<void> muatLaporan() async {
  debugPrint("Memuat laporan ...");
  await Future.delayed(const Duration(seconds: 3));
  debugPrint("Laporan  berhasil dimuat.");
}
void main() async {

  debugPrint("\n=== laporan penjualan ===");
await muatLaporan();

  var formatter = NumberFormat('#,###', 'id_ID');

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3000.0;
  double hargaUmum = 3500.0;
  int jumlahStok = 66;

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

  debugPrint(
    "Total (anggota) $jumlahBeli pcs: Rp${formatter.format(totalAnggota)}",
  );
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

  String kategori = "atk";
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
    "Harga akhir: Rp${ujiHargaAkhirA} Kategori: $lokasiRak",
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
    "Potongan borongan: 5% Harga akhir: Rp$ujiHargaAkhirB",
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
    "Potongan borongan: tanpa potongan Harga akhir: Rp$ujiHargaAkhirC",
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

  debugPrint(
    "Anggota, total 600.000 -> Potongan: "
    "${uji1Potongan / uji1Total * 100}% (harus 15%)",
  );

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

  debugPrint(
    "Umum, total 600.000 -> Potongan: "
    "${uji2Potongan / uji2Total * 100}% (harus tetap 10%, aturan lama)",
  );

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

  debugPrint(
    "Anggota, total 250.000 -> Potongan: "
    "${uji3Potongan / uji3Total * 100}% (harus tetap 10%, aturan lama)",
  );

  debugPrint("\n=== daftar barang ===");

  List<String> namaBarangList = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti"
  ];
  List<double> hargaBarangList = [3000, 2500, 1500, 5000];

  for (int i = 0; i < namaBarangList.length; i++) {
    int nomor = i + 1;
    debugPrint(
      "$nomor. ${namaBarangList[i]} - Rp. "
      "${formatter.format(hargaBarangList[i])}",
    );
  }

  debugPrint("\n--- Penjualan Buku Tulis ---");

  int stokBukuTulis = 3;

  while (stokBukuTulis > 0) {
    stokBukuTulis = stokBukuTulis - 1;
    debugPrint("Terjual 1, sisa stok: $stokBukuTulis");
  }

  debugPrint("\n=== Total nilai koperasi ===");

  List<String> namaBrgStok = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti"
  ];
  List<double> hargaBrgStok = [3000, 2500, 1500, 5000];
  List<int> jumlahBrgStok = [50, 100, 80, 20];

  double totalNilaiStok = 0;

  for (int i = 0; i < namaBrgStok.length; i++) {
    double nilaiBarang = hargaBrgStok[i] * jumlahBrgStok[i];
    totalNilaiStok = totalNilaiStok + nilaiBarang;
    debugPrint(
      "${namaBrgStok[i]} : ${jumlahBrgStok[i]} pcs x "
      "Rp${formatter.format(hargaBrgStok[i])} "
      "= Rp${formatter.format(nilaiBarang)}",
    );
  }

  debugPrint(
    "Total Nilai Seluruh Stok : "
    "Rp${formatter.format(totalNilaiStok)}",
  );

  debugPrint("\n=== laporan stok (< 5) ===");

  List<String> namaBrgCek = [
    "Buku Tulis",
    "Pulpen",
    "Penghapus",
    "Roti"
  ];
  List<int> stokBrgCek = [3, 100, 4, 20];

  for (int i = 0; i < namaBrgCek.length; i++) {
    if (stokBrgCek[i] < 5) {
      debugPrint(
        "${namaBrgCek[i]} - sisa stok: "
        "${stokBrgCek[i]} (PERLU RESTOCK!)",
      );
    }
  }

  debugPrint("\n=== fungs hitung total() ===");

  int jumlahTransaksi = 10;
  double hargaTransaksi = 3000.0;
  double hasilTotal = hitungTotal(jumlahTransaksi, hargaTransaksi);

  debugPrint("Jumlah : $jumlahTransaksi pcs");
  debugPrint(
    "Harga Satuan : Rp${formatter.format(hargaTransaksi)}",
  );
  debugPrint("Total : Rp${formatter.format(hasilTotal)}");

  debugPrint("\n== hitungan akhir ==");

  int jumlahTransaksi2 = 32;
  double hargaTransaksi2 = 3000.0;
  double persenPotonganTransaksi = 32.0;

  double totalSebelumPotongan =
      hitungTotal(jumlahTransaksi2, hargaTransaksi2);
  double hargaAkhirFungsi =
      hitungHargaAkhir(totalSebelumPotongan, persenPotonganTransaksi);

  debugPrint("Jumlah : $jumlahTransaksi2 pcs");
  debugPrint(
    "Harga Satuan : Rp${formatter.format(hargaTransaksi2)}",
  );
  debugPrint(
    "Total (sebelum potongan) : "
    "Rp${formatter.format(totalSebelumPotongan)}",
  );
  debugPrint(
    "Persentase Potongan : $persenPotonganTransaksi%",
  );
  debugPrint(
    "Harga Akhir : Rp${formatter.format(hargaAkhirFungsi)}",
  );

  debugPrint("\n=== fungsi hitung harga() ===");

  bool anggotaTes = true;
  double hargaAnggotaTes = 3000.0;
  double hargaUmumTes = 3500.0;

  double hargaTerpilih =
      hitungHarga(anggotaTes, hargaAnggotaTes, hargaUmumTes);

  debugPrint(
    "Status Pembeli : ${anggotaTes ? 'Anggota' : 'Umum'}",
  );
  debugPrint(
    "Harga Terpilih : Rp${formatter.format(hargaTerpilih)}",
  );

  debugPrint("\n== fungsi bayar khir komposisi ==");

  int jumlahBayar = 40;
  double hargaBayar = 3000.0;
  double persenPotonganBayar = 10;

  double totalBayarAkhir =
      bayarAkhir(jumlahBayar, hargaBayar, persenPotonganBayar);

  debugPrint("Jumlah : $jumlahBayar pcs");
  debugPrint(
    "Harga Satuan : Rp${formatter.format(hargaBayar)}",
  );
  debugPrint(
    "Persentase Potongan : $persenPotonganBayar%",
  );
  debugPrint(
    "Harga Akhir (via bayarakhir) : "
    "Rp${formatter.format(totalBayarAkhir)}",
  );

  debugPrint("\n== daftar objek barang (kelas) ==");

  Barang bukuTulis = Barang("Buku Tulis", 30000, 606);
  Barang pulpen = Barang("Pulpen", 25000, 100);
  Barang roti = Barang("Roti", 50000, 200);

  List<Barang> daftarBarang = [bukuTulis, pulpen, roti];

  for (int i = 0; i < daftarBarang.length; i++) {
    daftarBarang[i].tampilkan();
  }

  debugPrint("\n=== cek bisa jual T/F() ===");

  int permintaanBeli = 110;
  bool cekBukuTulis = bukuTulis.bisaDijual(permintaanBeli);
  debugPrint(
    "Mau beli $permintaanBeli ${bukuTulis.nama}, "
    "stok tersedia ${bukuTulis.stok} -> Bisa dijual: $cekBukuTulis",
  );

  int permintaanBesar = 50;
  bool cekPulpenBesar = pulpen.bisaDijual(permintaanBesar);
  debugPrint(
    "Mau beli $permintaanBesar ${pulpen.nama}, "
    "stok tersedia ${pulpen.stok} -> Bisa dijual: $cekPulpenBesar",
  );

  debugPrint("\n=== daftar objek pembeli ===");

  Pembeli rajah = Pembeli("Rajah", true);
  Pembeli thonny = Pembeli("Thonny", false);

  rajah.tampilkan();
  thonny.tampilkan();

  double hargaUntukRajah = hitungHarga(
    rajah.statusAnggota,
    bukuTulis.harga,
    bukuTulis.harga + 500,
  );
  debugPrint(
    "${rajah.nama} (${rajah.statusAnggota ? 'Anggota' : 'Umum'}) "
    "beli ${bukuTulis.nama} seharga Rp${formatter.format(hargaUntukRajah)}",
  );

  debugPrint("\n=-= enkapsulasi =-=");
  bukuTulis.jual(60);

  bukuTulis.jual(99);

  //mencegah manipulasi data
  //menjamikn transaksi yang sah tanpa ada kecurangan
  //maka dari itu private adalah cara yang paling bagus untuk sekarang
  //agar data data koperasi tidak di manipulasi oleh pihak yang tidak bertanggung jawab

  debugPrint("\n=== Proses beli ===");

  bukuTulis.prosesBeli("tigo");
  bukuTulis.prosesBeli("122");
  bukuTulis.prosesBeli("9999");

//Dengan adanya try-catch-finally, sistem terbukti bisa menangani
// kesalahan input tanpa harus berhenti total atau kehilangan data
// transaksi lainnya. Ini penting bagi pengurus koperasi karena mereka
// jadi yakin sistem tidak akan "rusak" atau butuh restart cuma gara-gara
// satu petugas salah ketik — sistem tetap stabil, memberi pesan yang
// jelas ke petugas untuk memperbaiki inputnya, dan tetap mencatat log
// setiap upaya transaksi (baik berhasil maupun gagal) sebagai jejak
// audit

//kenapa pesan spesif memabntu petugas
// Pesan spesifik seperti "'dua' bukan angka, ulangi" langsung menunjukkan
// DUA hal penting sekaligus: (1) apa yang tadi diketik petugas (persis
// nilai inputnya), dan (2) apa yang harus dilakukan selanjutnya (ulangi
// input). Ini jauh lebih membantu dibanding pesan generik seperti "Error"
// atau "Input tidak valid", yang tidak menjelaskan APA yang salah atau
// APA yang seharusnya dilakukan petugas. Dengan pesan spesifik, petugas
// tidak perlu bingung menebak-nebak kesalahannya, tidak perlu memanggil
// teknisi IT untuk hal sepele, dan bisa langsung memperbaiki input tanpa
// membuang waktu — mempercepat proses transaksi



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
          seedColor: const Color.fromARGB(255, 0, 255, 162),
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
            const Text('235443v:'),
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
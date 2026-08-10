import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class Barang {
  String nama;
  double harga;
  int stok;

  Barang(this.nama, this.harga, this.stok);

  void tampilkan() {
    debugPrint("=== KARTU BARANG ===");
    debugPrint("Nama  : $nama");
    debugPrint("Harga : Rp$harga");
    debugPrint("Stok  : $stok");
    debugPrint("");
  }
}

void main() {
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

  debugPrint("\n=== Total Nilai Koperasi ===");

  List<String> namaBrgStok = ["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
  List<double> hargaBrgStok = [3000, 2500, 1500, 5000];
  List<int> jumlahBrgStok = [50, 100, 80, 20];

  double totalNilaiStok = 0;

  for (int i = 0; i < namaBrgStok.length; i++) {
    double nilaiBarang = hargaBrgStok[i] * jumlahBrgStok[i];
    totalNilaiStok = totalNilaiStok + nilaiBarang;
    debugPrint(
      "${namaBrgStok[i]} : ${jumlahBrgStok[i]} pcs x Rp${formatter.format(hargaBrgStok[i])} "
      "= Rp${formatter.format(nilaiBarang)}"
    );
  }

  debugPrint("Total Nilai Seluruh Stok : Rp${formatter.format(totalNilaiStok)}");

  debugPrint("\n=== LAPORAN STOK MENIPIS (< 5) ===");

  List<String> namaBrgCek = ["Buku Tulis", "Pulpen", "Penghapus", "Roti"];
  List<int> stokBrgCek = [3, 100, 4, 20];

  for (int i = 0; i < namaBrgCek.length; i++) {
    if (stokBrgCek[i] < 5) {
      debugPrint("${namaBrgCek[i]} - sisa stok: ${stokBrgCek[i]} (PERLU RESTOCK!)");
    }
  }

  // ===== Panggil fungsi hitungTotal untuk sebuah transaksi =====
  debugPrint("\n=== FUNGSI hitungTotal() ===");

  int jumlahTransaksi = 10;
  double hargaTransaksi = 3000.0;
  double hasilTotal = hitungTotal(jumlahTransaksi, hargaTransaksi);

  debugPrint("Jumlah : $jumlahTransaksi pcs");
  debugPrint("Harga Satuan : Rp${formatter.format(hargaTransaksi)}");
  debugPrint("Total : Rp${formatter.format(hasilTotal)}");


  debugPrint("\n== hitungan akhir ==");

  int jumlahTransaksi2 = 32;
  double hargaTransaksi2 = 3000.0;
  double persenPotonganTransaksi = 32.0;

  double totalSebelumPotongan = hitungTotal(jumlahTransaksi2, hargaTransaksi2);
  double hargaAkhirFungsi = hitungHargaAkhir(totalSebelumPotongan, persenPotonganTransaksi);

  debugPrint("Jumlah : $jumlahTransaksi2 pcs");
  debugPrint("Harga Satuan : Rp${formatter.format(hargaTransaksi2)}");
  debugPrint("Total (sebelum potongan) : Rp${formatter.format(totalSebelumPotongan)}");
  debugPrint("Persentase Potongan : $persenPotonganTransaksi%");
  debugPrint("Harga Akhir : Rp${formatter.format(hargaAkhirFungsi)}");


  // "Bagaimana pemecahan program menjadi fungsi membantu koperasi bila
  // kelak aturan potongan diubah? Bagian mana yang cukup diubah sekali?"
  //
  // Enaknya kalau program dipecah jadi fungsi kayak hitungTotal() dan
  // hitungHargaAkhir() itu, rumusnya cuma ditulis SEKALI aja di dalam
  // fungsinya, nggak perlu disalin-salin lagi tiap kali ada transaksi baru.
  // Jadi misalnya suatu saat koperasi mau ganti aturan potongan — dari
  // yang tadinya 15% jadi 20%, atau nambah syarat diskon baru — kita
  // cukup ubah kodenya DI DALAM fungsi hitungHargaAkhir() itu doang, satu
  // tempat aja. Semua transaksi di seluruh program yang manggil fungsi
  // ini bakal otomatis ikut pakai aturan yang baru, tanpa perlu nyari-cari
  // dan ngubah satu-satu di banyak tempat yang berserakan. Ini bikin
  // program jadi jauh lebih gampang dirawat, dan ngurangin risiko ada
  // bagian yang "kelewatan" pas aturan diperbarui


  debugPrint("\n=== FUNGSI hitungHarga() ===");

  bool anggotaTes = true;
  double hargaAnggotaTes = 3000.0;
  double hargaUmumTes = 3500.0;

  double hargaTerpilih = hitungHarga(anggotaTes, hargaAnggotaTes, hargaUmumTes);

  debugPrint("Status Pembeli : ${anggotaTes ? 'Anggota' : 'Umum'}");
  debugPrint("Harga Terpilih : Rp${formatter.format(hargaTerpilih)}");


  // Mengapa memindah keputusan ini ke fungsi mengurangi risiko salah?
  // Kalau logika "pilih harga sesuai jenis pembeli" ditulis berulang-ulang
  // di banyak tempat (setiap kali ada transaksi baru), ada risiko besar
  // salah satu tempat lupa dituliskan atau tertukar urutan kondisinya
  // (misalnya keliru menaruh harga umum untuk anggota). Dengan memindahkan
  // logika ini ke dalam SATU fungsi hitungHarga(), aturan "anggota dapat
  // harga anggota, bukan anggota dapat harga umum" hanya perlu benar SEKALI
  // saja di dalam fungsi ini. Semua bagian program yang memanggil fungsi
  // ini otomatis mengikuti aturan yang sama dan konsisten, sehingga jauh
  // lebih kecil kemungkinan terjadi salah ketik atau salah logika yang
  // tercecer di berbagai tempat berbeda


  debugPrint("\n== FUNGSI bayar khir komposisi ==");

  int jumlahBayar = 40;
  double hargaBayar = 3000.0;
  double persenPotonganBayar = 10;

  double totalBayarAkhir = bayarAkhir(jumlahBayar, hargaBayar, persenPotonganBayar);

  debugPrint("Jumlah : $jumlahBayar pcs");
  debugPrint("Harga Satuan : Rp${formatter.format(hargaBayar)}");
  debugPrint("Persentase Potongan : $persenPotonganBayar%");
  debugPrint("Harga Akhir (via bayarakhir) : Rp${formatter.format(totalBayarAkhir)}");

  // Apa manfaat menyusun fungsi dari fungsi lain (komposisi)?
  // Dengan menyusun fungsi bayarAkhir() dari fungsi-fungsi yang sudah ada
  // sebelumnya (hitungTotal() dan hitungHargaAkhir()), kita tidak perlu
  // menulis ulang rumus perhitungan dari nol. Setiap fungsi kecil punya
  // tugasnya masing-masing yang jelas dan sederhana, lalu fungsi yang
  // lebih besar cukup "menyusun" atau menggabungkan fungsi-fungsi kecil
  // itu sesuai urutan proses yang diinginkan. Ini membuat kode lebih mudah
  // dibaca (langsung terlihat alur prosesnya: hitung total dulu, baru
  // hitung harga akhir), lebih mudah diuji satu per satu (kalau ada
  // kesalahan, gampang dilacak fungsi mana yang bermasalah), dan tetap
  // konsisten dengan aturan yang sudah didefinisikan di fungsi-fungsi
  // sebelumnya tanpa perlu duplikasi kode

  debugPrint("\n== dafftar objek barang (kelas) ==");

  Barang bukuTulis = Barang("Buku Tulis", 30000, 606);
  Barang pulpen = Barang("Pulpen", 25000, 100);
  Barang roti = Barang("Roti", 50000, 200);

  List<Barang> daftarBarang = [bukuTulis, pulpen, roti];
  
  for (int i = 0; i < daftarBarang.length; i++) {
    daftarBarang[i].tampilkan();
  }

// Dibanding cara Sprint 3 (List<String> namaBarangList dan List<double>
// hargaBarangList terpisah), cara ini jauh lebih baik karena satu barang
// sekarang tersimpan sebagai SATU objek utuh (nama, harga, stok jadi
// satu kesatuan), bukan tersebar di beberapa list terpisah yang harus
// diakses pakai index yang sama secara manual (misal namaBarangList[i]
// dan hargaBarangList[i])


// Sprint 5 justifikasi dan komen nua

// Memodelkan barang sebagai objek (OOP) membuat pengembangan sistem koperasi 
// lebih terstruktur. Atribut seperti nama, harga, dan stok serta perilakunya 
// tergabung dalam kelas Barang (enkapsulasi). Jika ada perubahan pada struktur 
// data, cukup ubah di kelas itu tanpa merusak bagian kode lain
// Selain itu, sistem jadi lebih mudah dikembangkan lewat konsep pewarisan 
// (inheritance). Misalnya, koperasi mungkin perlu kategori khusus untuk barang 
// kedaluwarsa atau bergaransi. Data tiap barang juga jadi lebih terisolasi dan 
// aman, sehingga risiko bug akibat data yang tertukar atau indeks list yang 
// tidak sinkron dapat dihindari saat transaksi kasirr

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
// standar Indonesia (titik sebagai pemisah ribuan)
class History {
  late String nama;
  late num ktp;
  late String tempatLahir;
  late DateTime tanggalLahir;
  late num nomorTelepon;
  late String namaKlinik;
  late DateTime tanggalVaksinasi;

  History({
    required this.nama,
    required this.ktp,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.namaKlinik,
    required this.tanggalVaksinasi
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'ktp': ktp,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tanggalLahir,
      'nomorTelepon': nomorTelepon,
      'namaKlinik': namaKlinik,
      'tanggalVaksinasi': tanggalVaksinasi
    };
  }

  History.fromMap(Map<String, dynamic> map) {
    nama = map['nama'];
    ktp = map['ktp'];
    tempatLahir = map['tempatLahir'];
    tanggalLahir = map['tanggalLahir'];
    nomorTelepon = map['nomorTelepon'];
    namaKlinik = map['namaKlinik'];
    tanggalVaksinasi = map['tanggalVaksinasi'];
  }
}
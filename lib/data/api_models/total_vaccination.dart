class TotalVaccination {
  late int jumlahVaksinasi1;
  late int jumlahVaksinasi2;

  TotalVaccination({
    required this.jumlahVaksinasi1,
    required this.jumlahVaksinasi2
  });

  factory TotalVaccination.fromJson(Map<String, dynamic> json) {
    return TotalVaccination(
        jumlahVaksinasi1: json['jumlah_vaksinasi_1'],
        jumlahVaksinasi2: json['jumlah_vaksinasi_2']
    );
  }
}
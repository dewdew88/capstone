class AdditionalVaccinations {
  late int jumlahVaksinasi1;
  late int jumlahVaksinasi2;
  late DateTime tanggal;
  late DateTime created;

  AdditionalVaccinations({
    required this.jumlahVaksinasi1,
    required this.jumlahVaksinasi2,
    required this.tanggal,
    required this.created,
  });

  factory AdditionalVaccinations.fromJson(Map<String, dynamic> json) {
    return AdditionalVaccinations(
        jumlahVaksinasi1: json["jumlah_vaksinasi_1"],
        jumlahVaksinasi2: json["jumlah_vaksinasi_2"],
        tanggal: DateTime.parse(json["tanggal"]),
        created: DateTime.parse(json["created"])
    );
  }
}
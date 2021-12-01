import 'package:capstone/data/api_models/value.dart';

class DailyVaccination {
  late DateTime keyAsString;
  late int key;
  late int docCount;
  late Value jumlahVaksinasi2;
  late Value jumlahVaksinasi1;
  late Value jumlahKumVaksinasi1;
  late Value jumlahKumVaksinasi2;

  DailyVaccination({
    required this.keyAsString,
    required this.key,
    required this.docCount,
    required this.jumlahVaksinasi2,
    required this.jumlahVaksinasi1,
    required this.jumlahKumVaksinasi1,
    required this.jumlahKumVaksinasi2
  });

  factory DailyVaccination.fromJson(Map<String, dynamic> json) {
    return DailyVaccination(
        keyAsString: DateTime.parse(json["key_as_string"]),
        key: json['key'],
        docCount: json['doc_count'],
        jumlahVaksinasi2: Value.fromJson(json['jumlah_vaksinasi_2']),
        jumlahVaksinasi1: Value.fromJson(json['jumlah_vaksinasi_1']),
        jumlahKumVaksinasi1: Value.fromJson(json['jumlah_jumlah_vaksinasi_1_kum']),
        jumlahKumVaksinasi2: Value.fromJson(json['jumlah_jumlah_vaksinasi_2_kum'])
    );
  }
}
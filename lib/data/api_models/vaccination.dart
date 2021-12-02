import 'package:capstone/data/api_models/total_vaccination.dart';

import 'additional_vaccination.dart';
import 'daily_vaccination.dart';

class Vaccination {
  final AdditionalVaccinations penambahan;
  final List<DailyVaccination> harian;
  final TotalVaccination total;

  Vaccination({
    required this.penambahan,
    required this.harian,
    required this.total
  });

  factory Vaccination.fromJson(Map<String, dynamic> json) {
    return Vaccination(
        penambahan: AdditionalVaccinations.fromJson(json['penambahan']),
        harian: List<DailyVaccination>.from(json['harian']
            .map((x) => DailyVaccination.fromJson(x))
        ),
        total: TotalVaccination.fromJson(json['total'])
    );
  }
}
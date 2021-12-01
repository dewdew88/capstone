import 'dart:convert';
import 'package:capstone/data/api_models/vaccination.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const url = 'https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json';

  Future<Vaccination> fetchVaccination() async {
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Vaccination.fromJson(jsonDecode(response.body)['vaksinasi']);
    } else {
      throw Exception('Failed to load vaccination data');
    }
  }
}
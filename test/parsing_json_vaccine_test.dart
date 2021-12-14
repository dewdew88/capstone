import 'package:capstone/data/models/vaccine.dart';
import 'package:flutter_test/flutter_test.dart';

var testVaccineLocData = {
  "id": 1,
  "name": "RSUD Dr. H. Abdul Moeloek",
  "city": "Bandar Lampung",
  "address":
      ": Jl. Dr. Rivai No.6, Penengahan, Kec. Tj. Karang Pusat, Kota Bandar Lampung, Lampung 35112",
  "date": "9 Agu 2021 - 31 Mar 2022",
  "time": "08:00 - 12:00",
  "contact": "0721 - 703312",
  "quota": 50,
  "type": "Moderna, AstraZeneca",
  "urlImage":
      "https://www.kupastuntas.co/uploads/posts/mulai-10-desember-skema-kerja-igd-rsud-abdul-moelo_20201208223623.jpg"
};

void main() {
  test("Test Parsing Json Vaccine", () async {
    var result = Vaccine.fromJson(testVaccineLocData).id;
    expect(result, 1);
  });
}

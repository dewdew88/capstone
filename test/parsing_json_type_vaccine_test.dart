import 'package:capstone/data/models/type_vaccine.dart';
import 'package:flutter_test/flutter_test.dart';

var testTypeVaccineData = {
  "id": 2,
  "name": "Sinopharm",
  "description":
      "Vaksin Sinopharm adalah vaksin untuk mencegah infeksi virus Corona atau COVID-19. Vaksin Sinopharm ini direncanakan menjadi bagian dari vaksinasi mandiri atau vaksinasi gotong royong di Indonesia. Vaksin Sinopharm berisi virus Corona yang dimatikan (inactivated virus). Vaksin Sinopharm bekerja dengan cara memicu sistem kekebalan tubuh untuk menghasilkan antibodi yang dapat melawan virus Corona.\n\nBelum ada data yang memadai terkait efektivitas dan keamanan vaksin Sinopharm pada ibu hamil dan ibu menyusui. Vaksin ini tidak boleh digunakan oleh ibu hamil dan ibu menyusui.",
  "effects":
      "Berdasarkan analisis data uji klinis tahap 2, efek samping vaksin Sinopharm masuk dalam kategori ringan-sedang, tidak berbahaya, dan bisa pulih dengan cepat. Efek samping yang dapat terjadi setelah disuntik vaksin Sinopharm adalah nyeri dan kemerahan pada area yang disuntik, demam ringan, sakit kepala, dan rasa Lelah.",
  "picture_url":
      "https://static.republika.co.id/uploads/images/inpicture_slide/007485600-1629365125-thumbs_b_c_279cc452257ae5a24b4.jpg"
};

void main() {
  test("Test Parsing Json Type Vaccine", () async {
    var result = TypeVaccine.fromJson(testTypeVaccineData).id;
    expect(result, 2);
  });
}

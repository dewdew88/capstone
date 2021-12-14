import 'package:capstone/data/models/article.dart';
import 'package:flutter_test/flutter_test.dart';

var testArticleData = {
  "author": "UNICEF",
  "title": "Hal-Hal Penting Seputar Vaksin COVID-19",
  "url":
      "https://www.unicef.org/indonesia/id/coronavirus/hal-hal-penting-seputar-vaksin-covid-19",
  "urlToImage":
      "https://www.unicef.org/indonesia/sites/unicef.org.indonesia/files/styles/hero_desktop/public/09%20Vaccine%20-%20Kediri%20-%20Fauzan.jpg?itok=c9LT7171",
  "publishedAt": "03 Juni 2021",
  "content":
      "Vaksin menyelamatkan jutaan nyawa setiap tahun. Pengembangan vaksin COVID-19 yang aman dan efektif adalah langkah penting dalam upaya global untuk mengakhiri pandemi, agar masyarakat dapat kembali berkegiatan seperti biasa dan bertemu dengan keluarga serta kerabat tercinta.\n\nInformasi berikut adalah informasi terkini dari para pakar yang telah kami kumpulkan untuk menjawab beberapa pertanyaan paling umum seputar vaksin COVID-19. Artikel ini akan diperbarui secara berkala sesuai dengan perkembangan informasi.[+1360 chars]"
};

void main() {
  test("Test Parsing Json Article", () async {
    var result = Article.fromJson(testArticleData).url;
    expect(result,
        "https://www.unicef.org/indonesia/id/coronavirus/hal-hal-penting-seputar-vaksin-covid-19");
  });
}

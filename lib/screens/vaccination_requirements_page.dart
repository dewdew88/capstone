import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  final List<String> data = [
    'Tidak memiliki penyakit yang kronis seperti penyakit jantung, autoimun, gagal ginjal kronis, rematik autoimun, penyakit saluran pencernaan kronis, hipertiroid atau hipotiroid, serta penyakit kanker.',
    'Tidak sedang mengalami infeksi akut yang disertai dengan demam, batuk, pilek, diare, dan lain-lain.',
    'Tidak memiliki anggota keluarga yang menjadi pasien COVID-19 atau sedang dalam perawatan COVID-19.',
    "Tidak dalam kondisi demam atau suhu diatas 37,5'C.",
    'Pengidap diabetes tipe 2 terkontrol dan HbA1C di bawah 58 mmol/mol atau 7,5 persen dapat diberikan vaksinasi COVID-19.',
    'Tidak memiliki penyakit paru, seperti asma, PPOK, atau TBC, maka vaksinasi akan ditunda hingga kondisi Anda dapat dinyatakan baik.',
    'Untuk pengidap TBC yang masih dalam perawatan, vaksinasi dapat diberikan setelah dua minggu menerima obat antituberkulosis.',
    'Tidak memiliki tekanan darah yang tinggi atau diatas 180/110.',
    'Penyintas COVID-19 bisa mendapatkan vaksinasi minimal tiga bulan setelah sembuh.'
  ];

  Requirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Text> dataIndex = data.asMap().entries.map((e) => Text('\u2022 ${e.value}', style: Theme.of(context).textTheme.bodyText1,)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ketentuan Vaksin'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Berikut ini adalah beberapa syarat untuk penerima vaksin covid-19, yaitu :',
                style: Theme.of(context).textTheme.headline6,
              ),
              //SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dataIndex,
                ),
              ),
              Text('Jika anda merasa kurang mengerti atau ada yang ingin ditanyakan, anda dapat berkonsultasi secara langsung dengan dokter.',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }

}
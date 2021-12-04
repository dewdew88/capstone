import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  static const routeName = '/registration';

  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Vaksinasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Text('Nama Lengkap'),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Nama Lengkap Anda'
                ),
              ),
              const SizedBox(height: 5),
              const Text('Nomor Kependudukan'),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nomor Kependudukan Anda'
                ),
              ),
              const SizedBox(height: 5),
              const Text('Tempat Lahir'),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Tempat Lahir Anda'
                ),
              ),
              const SizedBox(height: 5),
              const Text('Tanggal Lahir'),
              const SizedBox(height: 5),
              const Text('Nomor Telepon'),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nomor Telepon Anda'
                ),
              ),
              const SizedBox(height: 5),
              const Text('Nama Klinik'),
              const TextField(
                readOnly: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama Klinik'
                ),
              ),
              const SizedBox(height: 5),
              const Text('Tanggal Vaksinasi'),
              DateTimeField(
                format: DateFormat("dd/MM/yyyy"),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      initialDate: currentValue ?? DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2022)
                  );
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Tanggal Vaksinasi Anda',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
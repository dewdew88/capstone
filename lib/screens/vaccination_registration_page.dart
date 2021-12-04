import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
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
            children: const [
              Text('Nama Lengkap'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Nama Lengkap Anda'
                ),
              ),
              SizedBox(height: 5),
              Text('Nomor Kependudukan'),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nama Lengkap Anda'
                ),
              ),
              SizedBox(height: 5),
              Text('Tempat Lahir'),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nama Lengkap Anda'
                ),
              ),
              SizedBox(height: 5),
              Text('Tanggal Lahir'),
              SizedBox(height: 5),
              Text('Nomor Telepon'),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nama Lengkap Anda'
                ),
              ),
              SizedBox(height: 5),
              Text('Nama Klinik'),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama Klinik'
                ),
              ),
              SizedBox(height: 5),
              Text('Tanggal Vaksinasi'),
            ],
          ),
        ),
      ),
    );
  }

}
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
  final _nameController = TextEditingController();
  final _ktpController = TextEditingController();
  final _tempatLahirController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _nomorTeleponController = TextEditingController();
  final _tanggalVaksinasiController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _ktpController.dispose();
    _tempatLahirController.dispose();
    _tanggalLahirController.dispose();
    _nomorTeleponController.dispose();
    _tanggalVaksinasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Vaksinasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nama Lengkap',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Nama Lengkap Anda'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  'Nomor Kependudukan',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _ktpController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Nomor Kependudukan Anda'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  'Tempat Lahir',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _tempatLahirController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Tempat Lahir Anda'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  'Tanggal Lahir',
                  style: Theme.of(context).textTheme.headline6,
                ),
                DateTimeField(
                  controller: _tanggalLahirController,
                  format: DateFormat('dd/MM/yyyy'),
                  onShowPicker: (context, currentVal) {
                    return showDatePicker(
                      context: context,
                      initialDate: currentVal ?? DateTime(2010),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2015),
                    );
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Tanggal Lahir Anda',
                  ),
                  validator: (DateTime? value) {
                    if (value == null) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  'Nomor Telepon',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _nomorTeleponController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Nomor Telepon Anda'
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  'Nama Klinik',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Klinik'
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Tanggal Vaksinasi',
                  style: Theme.of(context).textTheme.headline6,
                ),
                DateTimeField(
                  controller: _tanggalVaksinasiController,
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
                  validator: (DateTime? value) {
                    if (value == null) {
                      return 'Wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {}
                    });
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
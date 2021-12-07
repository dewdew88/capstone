import 'package:capstone/common/styles.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration extends StatefulWidget {
  static const routeName = '/registration';
  String klinik;

  Registration({Key? key, required this.klinik}) : super(key: key);

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

  clear(){
    _nameController.clear();
    _ktpController.clear();
    _tempatLahirController.clear();
    _tanggalLahirController.clear();
    _nomorTeleponController.clear();
    _tanggalVaksinasiController.clear();
  }

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
                Text(widget.klinik,
                    style: Theme.of(context).textTheme.bodyText1,
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
                Text('Setelah melakukan pendaftaran, Anda akan dihubungi oleh pihak dari Rumah Sakit/Puskesmas/Klinik yang telah dipilih untuk melakukan konfirmasi',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: secondaryColor),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()){
                          FirebaseFirestore.instance.collection('registration').doc(DateFormat('d-M-y').format(DateTime.now())).collection(widget.klinik).doc(_nameController.text).set({
                            'nama_lengkap': _nameController.text,
                            'nomor_ktp': _ktpController.text,
                            'tempat_lahir': _tempatLahirController.text,
                            'tanggal_lahir': _tanggalLahirController.text,
                            'nomor_telepon': _nomorTeleponController.text,
                            'nama_klinik': widget.klinik,
                            'tanggal_vaksinasi': _tanggalVaksinasiController.text
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Center(child: Text('Pendaftaran Vaksinasi Berhasil')),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    )
                                  ],
                                );
                              }
                          );
                          clear();
                        }
                      });
                    },
                    child: const Text('Daftar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
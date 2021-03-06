import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration extends StatefulWidget {
  static const routeName = '/registration';
  final String klinik;

  const Registration({Key? key, required this.klinik}) : super(key: key);

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

  bool isOnline = false;

  void initialize() async {
    var connectivity = await (Connectivity().checkConnectivity());
    checkConnection(connectivity);
    Connectivity().onConnectivityChanged.listen((connectivity) {
      checkConnection(connectivity);
    });
  }

  void checkConnection(ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isOnline = true;
        }
      } on SocketException catch (_) {
        isOnline = false;
      }
    } else {
      isOnline = false;
    }
  }

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
    initialize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Vaksinasi', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 5),
                const Text(
                  'Nomor Kependudukan',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ktpController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tempat Lahir',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    controller: _tempatLahirController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tanggal Lahir',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: DateTimeField(
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 5),
                const Text(
                  'Nomor Telepon',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _nomorTeleponController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tempat Vaksinasi',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(widget.klinik,
                    style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Tanggal Vaksinasi',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  child: DateTimeField(
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                ),
                const SizedBox(height: 8),
                Text('Setelah melakukan pendaftaran, Anda akan dihubungi oleh pihak dari Rumah Sakit/Puskesmas/Klinik yang telah dipilih untuk melakukan konfirmasi',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.blueAccent),
                ),
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()){
                          if (isOnline == true) {
                            FirebaseFirestore.instance.collection('registration').doc(DateFormat('d-M-y').format(DateTime.now())).collection(widget.klinik).doc(_ktpController.text).set({
                              'nama_lengkap': _nameController.text,
                              'nomor_ktp': num.parse(_ktpController.text),
                              'tempat_lahir': _tempatLahirController.text,
                              'tanggal_lahir': _tanggalLahirController.text,
                              'nomor_telepon': _nomorTeleponController.text,
                              'nama_klinik': widget.klinik,
                              'tanggal_vaksinasi': _tanggalVaksinasiController.text
                            });
                            showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 5,
                                    title: const Text('Pendaftaran Vaksinasi Berhasil'),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(100, 40)
                                            )
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            );
                            clear();
                          } else {
                            showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 5,
                                    title: const Text('Pendaftaran Vaksinasi Gagal'),
                                    content: const Text('Silahkan periksa koneksi internet anda'),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(100, 40)
                                            )
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            );
                          }
                        }
                      });
                    },
                    child: const Text('Daftar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(90, 45)
                    )
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
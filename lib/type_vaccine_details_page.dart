import 'package:capstone/data/models/type_vaccine.dart';
import 'package:flutter/material.dart';

class TypeVaccineDetails extends StatelessWidget {
  static const routeName = '/type_vaccine_detail';

  final TypeVaccine vaccine;

  const TypeVaccineDetails({Key? key, required this.vaccine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network('src'),
          ],
        ),
      ),
    );
  }

}
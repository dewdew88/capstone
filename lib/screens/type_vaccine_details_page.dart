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
            Stack(
              children: [
                Hero(
                  tag: vaccine.pictureUrl,
                  child: Image.network(vaccine.pictureUrl),
                ),
                SafeArea(
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            _buildDetailsText(),
          ],
        ),
      ),
    );
  }

  Padding _buildDetailsText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(vaccine.name),
          const SizedBox(height: 10),
          const Text(
            'Deskripsi',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Text(vaccine.description),
          const SizedBox(height: 10),
          const Text(
            'Efek Samping',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          Text(vaccine.effects),
        ],
      ),
    );
  }
}
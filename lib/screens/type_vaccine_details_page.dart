import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/type_vaccine.dart';
import 'package:flutter/material.dart';

class TypeVaccineDetails extends StatelessWidget {
  static const routeName = '/type_vaccine_detail';

  final TypeVaccine vaccine;

  const TypeVaccineDetails({Key? key, required this.vaccine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: secondaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              _buildDetailsText(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildDetailsText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vaccine.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          const Text(
            'Deskripsi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            vaccine.description,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 15),
          const Text(
            'Efek Samping',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            vaccine.effects,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
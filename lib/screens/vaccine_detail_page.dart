import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/vaccine.dart';
import 'package:capstone/screens/vaccination_registration_page.dart';
import 'package:flutter/material.dart';

class VaccineDetailPage extends StatelessWidget {
  static const routeName = '/vaccine_detail_page';

  final Vaccine vaccineLoc;

  VaccineDetailPage({required this.vaccineLoc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: vaccineLoc.urlImage,
                    child: Image.network(
                      vaccineLoc.urlImage,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: secondaryColor,
                    ),
                  )
                ],
              ),
              _buildDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vaccineLoc.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.location_city_rounded,
                  color: secondaryColor,
                  size: 18,
                ),
              ),
              Text(vaccineLoc.city),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.location_on,
                  color: secondaryColor,
                  size: 18,
                ),
              ),
              Expanded(
                child: Text(vaccineLoc.address),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.call_rounded,
                  color: secondaryColor,
                  size: 18,
                ),
              ),
              Text(vaccineLoc.contact),
            ],
          ),
          Divider(color: Colors.grey),
          Text('Tanggal operasional : ${vaccineLoc.date}'),
          Text('Waktu operasional : ${vaccineLoc.time}'),
          Text('Jenis vaksin tersedia : ${vaccineLoc.type}'),
          Text('Kuota penerima vaksin : ${vaccineLoc.quota}'),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Registration.routeName, arguments: vaccineLoc.name);
              },
              child: Text('Daftar Sekarang'),
            ),
          ),
        ],
      ),
    );
  }
}

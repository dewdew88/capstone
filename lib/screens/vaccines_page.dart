import 'package:capstone/common/styles.dart';
import 'package:capstone/data/models/vaccine.dart';
import 'package:capstone/screens/vaccine_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaccinePage extends StatelessWidget {
  static const routeName = '/vaccines_page';

  const VaccinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/vaccine.json'),
        builder: (context, snapshot) {
          final List<Vaccine> listVaccineLocation =
              parsedVaccine(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: listVaccineLocation.length,
              itemBuilder: (context, index) {
                var vaccineLoc = listVaccineLocation[index];
                return Card(
                  margin:
                      EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 6),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    leading: Hero(
                      tag: vaccineLoc.urlImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          vaccineLoc.urlImage,
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                    ),
                    title: Text(
                      vaccineLoc.name,
                      maxLines: 1,
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.location_city_rounded,
                                color: secondaryColor,
                                size: 18,
                              ),
                            ),
                            Text(
                              vaccineLoc.city,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.enhanced_encryption_rounded,
                                color: secondaryColor,
                                size: 18,
                              ),
                            ),
                            Text(
                              vaccineLoc.type,
                              maxLines: 1,
                            )
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, VaccineDetailPage.routeName,
                          arguments: vaccineLoc);
                    },
                  ),
                );
              },
            );
          } else {
            return const Text('Data not exist');
          }
        },
      ),
    );
  }
}

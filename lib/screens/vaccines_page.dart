import 'package:capstone/data/models/vaccine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaccinePage extends StatelessWidget {
  const VaccinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine Location'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/vaccine.json'),
        builder: (context, snapshot) {
          final List<Vaccine> listVaccineLocation = parsedVaccine(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: listVaccineLocation.length,
              itemBuilder: (context, index) {
                var vaccineLoc = listVaccineLocation[index];
                return Card(
                  child: ListTile(
                    leading: Hero(
                      tag: vaccineLoc.urlImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(vaccineLoc.urlImage, fit: BoxFit.cover,),
                      ),
                    ),
                    title: Text(
                      vaccineLoc.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 5),
                        Text(vaccineLoc.city),
                      ],
                    ),
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
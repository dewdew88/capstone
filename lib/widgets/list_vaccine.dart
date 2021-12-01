import 'package:capstone/data/models/type_vaccine.dart';
import 'package:capstone/type_vaccine_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListVaccine extends StatelessWidget {
  const ListVaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/type_vaccine.json'),
      builder: (context, snapshot) {
        final List<TypeVaccine> listVaccines = parsedTypeVaccine(snapshot.data);
        if (snapshot.hasData) {
          return GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: 6/2,
           ),
           itemCount: listVaccines.length,
           itemBuilder: (context, index) {
             var vaccine = listVaccines[index];
              return Card(
                color: Colors.grey,
                child: ListTile(
                    leading: Image.network(
                      vaccine.pictureUrl,
                      width: 50,
                      height: 40,
                    ),
                    title: Text(
                      vaccine.name,
                      style: const TextStyle(
                          fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, TypeVaccineDetails.routeName, arguments: vaccine);
                    },
                  ),
              );
            }
          );
        } else {
          return const SizedBox(height: 1);
        }
      }
    );
  }
}
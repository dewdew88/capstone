import 'package:capstone/data/models/type_vaccine.dart';
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
           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
             childAspectRatio: 5/2,
           ),
           itemCount: listVaccines.length,
           itemBuilder: (context, index) {
             var vaccine = listVaccines[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: ListTile(
                    leading: Image.network(
                      vaccine.pictureUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      vaccine.name,
                      style: const TextStyle(
                          fontSize: 12,
                      ),
                    ),
                  ),
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
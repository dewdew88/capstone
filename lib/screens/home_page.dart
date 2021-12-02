import 'package:capstone/widgets/carousel_slider.dart';
import 'package:capstone/widgets/curve.dart';
import 'package:capstone/widgets/list_vaccine.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderCarousel(),
            const SizedBox(height: 8),
            Text(
              'Distribusi Vaksin',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.95 * 0.75,
              child: const VaccinationCurve(),
            ),
            Text(
              'Jenis Vaksin',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 180,
                child: ListVaccine(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:capstone/widgets/carousel_slider.dart';
import 'package:capstone/widgets/curve.dart';
import 'package:capstone/widgets/list_vaccine.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SliderCarousel(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Distribusi Vaksin',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.95 * 0.75,
              child: const VaccinationCurve(),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Jenis Vaksin',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                clipBehavior: Clip.hardEdge,
                //height: 190,
                child: const ListVaccine(),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

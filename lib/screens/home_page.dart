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
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.95 * 0.75,
              child: const VaccinationCurve(),
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
import 'package:capstone/data/api/api_service.dart';
import 'package:capstone/data/api_models/vaccination.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VaccinationCurve extends StatefulWidget {
  const VaccinationCurve({Key? key}) : super(key: key);

  @override
  _CurveState createState() => _CurveState();
}

class _CurveState extends State<VaccinationCurve> {
  @override
  Widget build(BuildContext context) {
    List<int> values1 = [];
    List<int> values2 = [];

    return FutureBuilder(
        future: ApiService().fetchVaccination(),
        builder: (context, AsyncSnapshot<Vaccination> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.harian.length; i++) {
              values1.add(snapshot.data!.harian[i].jumlahKumVaksinasi1.value);
              values2.add(snapshot.data!.harian[i].jumlahKumVaksinasi2.value);
            }
            List<FlSpot> spots1 = values1.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.toDouble());
            }).toList();
            List<FlSpot> spots2 = values2.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.toDouble());
            }).toList();

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(4),
                  color: Colors.grey[350],
                ),
                height: MediaQuery.of(context).size.width * 0.95 * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots1,
                          isCurved: true,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [Colors.lightBlueAccent.withOpacity(0.5)],
                          ),
                          dotData: FlDotData(show: false),
                        ),
                        LineChartBarData(
                            spots: spots2,
                            isCurved: true,
                            barWidth: 2,
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Colors.blueAccent.withOpacity(0.7)],
                            ),
                            dotData: FlDotData(show: false),
                            colors: [Colors.blue]),
                      ],
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: false,
                        ),
                        rightTitles: SideTitles(
                          showTitles: false,
                        ),
                        topTitles: SideTitles(
                          showTitles: false,
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                        ),
                      ),
                      axisTitleData: FlAxisTitleData(
                        topTitle: AxisTitle(
                          showTitle: true,
                          titleText: 'Vaccination Curve',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                          show: true,
                          checkToShowVerticalLine: (double value) {
                            return value == 1;
                          }),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Text('Error');
          }
        }
    );
  }
}

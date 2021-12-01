import 'package:capstone/data/api/api_service.dart';
import 'package:capstone/data/api_models/vaccination.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Curve extends StatefulWidget {
  @override
  _CurveState createState() => _CurveState();
}

class _CurveState extends State<Curve> {
  @override
  Widget build(BuildContext context) {
    List<int> values = [];

    return Scaffold(
        body: FutureBuilder(
            future: ApiService().fetchVaccination(),
            builder: (context, AsyncSnapshot<Vaccination> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                for (int i = 1; i < snapshot.data!.harian.length; i++) {
                  values.add(snapshot.data!.harian[i].jumlahKumVaksinasi1.value);
                }
                List<FlSpot> spots = values.asMap().entries.map((e) {
                  return FlSpot(e.key.toDouble(), e.value.toDouble());
                }).toList();

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(4),
                      color: Colors.grey[350],
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              barWidth: 3,
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [
                                  Colors.lightBlueAccent.withOpacity(0.5)
                                ],
                              ),
                              dotData: FlDotData(show: false),
                            ),
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
                              )
                          ),
                          gridData: FlGridData(
                              show: true,
                              checkToShowVerticalLine: (double value) {
                                return value == 1;
                              }
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Text('Error');
              }
            }
        )
    );
  }
}

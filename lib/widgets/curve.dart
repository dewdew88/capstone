import 'package:capstone/data/api/api_service.dart';
import 'package:capstone/provider/response_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:capstone/provider/curve_provider.dart';
import 'package:provider/provider.dart';

class VaccinationCurve extends StatelessWidget {
  const VaccinationCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> values1 = [];
    List<int> values2 = [];

    return ChangeNotifierProvider(
      create: (_) => CurveProvider(apiService: ApiService()),
      child: Consumer<CurveProvider>(
        builder: (context, state, _) {
          if (state.vaccinationState == ResponseState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.vaccinationState == ResponseState.hasData) {
            for (int i = 0; i < state.vaccinationData.harian.length; i++) {
              values1.add(
                  state.vaccinationData.harian[i].jumlahKumVaksinasi1.value);
              values2.add(
                  state.vaccinationData.harian[i].jumlahKumVaksinasi2.value);
            }
            List<FlSpot> spots1 = values1.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.toDouble());
            }).toList();
            List<FlSpot> spots2 = values2.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.toDouble());
            }).toList();

            return Padding(
              padding: const EdgeInsets.all(10.0),

              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.95 * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Expanded(
                          flex: 6,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots1,
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
                                LineChartBarData(
                                    spots: spots2,
                                    isCurved: true,
                                    barWidth: 2,
                                    belowBarData: BarAreaData(
                                      show: true,
                                      colors: [
                                        Colors.blueAccent.withOpacity(0.7)
                                      ],
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
                              // axisTitleData: FlAxisTitleData(
                              //   topTitle: AxisTitle(
                              //     showTitle: true,
                              //     titleText: 'Vaccination Curve',
                              //     textStyle: const TextStyle(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              gridData: FlGridData(
                                  show: true,
                                  checkToShowVerticalLine: (double value) {
                                    return value == 1;
                                  }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  2.0)),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('First vaccination'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                2.0),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('Second vaccination'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state.vaccinationState == ResponseState.noData) {
            return Text(state.message);
          } else if (state.vaccinationState == ResponseState.error) {
            return const Text('Error');
          }
          return const SizedBox(height: 1);
        },
      ),
    );
  }
}

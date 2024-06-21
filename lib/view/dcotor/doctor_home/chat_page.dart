// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../controllers/doctor_controller/doctor_appontment_list.dart';
import '../../../controllers/doctor_controller/doctor_bottom_controller.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Chart extends StatelessWidget {
  final int pending;
  final int confirmed;

  Chart({
    super.key,
    required this.pending,
    required this.confirmed,
  });

  // int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final homechartprovider = Provider.of<DoctorAppontmentList>(context);

    return AspectRatio(
      aspectRatio: 1.5,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Consumer2<DoctorAppontmentList, DoctorBottomController>(
              builder: (context, homechartvalues, chartData, child) {
                return PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        // setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          homechartprovider.touchedIndex = -1;
                          return;
                        }

                        homechartprovider.chartpopup(pieTouchResponse
                            .touchedSection!.touchedSectionIndex);
                        // homechartprovider.touchedIndex =
                        //     pieTouchResponse.touchedSection!.touchedSectionIndex;
                        // });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: showingSections(
                      context,
                      pending,
                      confirmed,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
                    Text(
                      'Comfirmed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.yellow,
                    ),
                    Text(
                      'pending',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // Row(
                //   children: [
                //     CircleAvatar(
                //       radius: 10,
                //       backgroundColor: AppColors.golden,
                //     ),
                //     Text('confirmed',style: TextStyle(fontWeight: FontWeight.bold),),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
    BuildContext context,
    int peindings,
    int confirmed,
  ) {
    final homechartprovider = Provider.of<DoctorAppontmentList>(context);
    final chartData = Provider.of<DoctorBottomController>(context);

     log(chartData.workcompleted.toString());
    int others = 0;

    return List.generate(3, (i) {
      if (peindings == 0 && confirmed == 0) {
        others = 1;
      }
      final isTouched = i == homechartprovider.touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 241, 197, 0),
            value: peindings.toDouble(),
            title: '$peindings',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: confirmed.toDouble(),
            title: '${chartData.workcompleted}',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.black,
            value: others.toDouble(),
            title: 'No Progress',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .98,
          );
        // case 3:
        //   return PieChartSectionData(
        //     color: Colors.indigoAccent,
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //       fontSize: fontSize,
        //       fontWeight: FontWeight.bold,
        //       color: const Color(0xffffffff),
        //       shadows: shadows,
        //     ),
        //   );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
    );
  }
}

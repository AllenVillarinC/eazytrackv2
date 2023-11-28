import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartValues extends StatelessWidget {
  const PieChartValues({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 * screenScaling(context),
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      3,
      (i) {
        const fontSize = 16.0;
        const radius = 100.0;
        const shadows = [Shadow(color: Colors.white, blurRadius: 2)];

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: ColorTween(
                begin: const Color(0xff151515),
                end: const Color(0xffc9ff99),
              ).lerp(0.75),
              value: ((totalNeeds / needs) * 100) * 0.5,
              title:
                  '${(((totalNeeds / needs) * 100) * 0.5).toStringAsFixed(2)} %',
              radius: radius,
              titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: ColorTween(
                begin: const Color(0xff151515),
                end: const Color(0xffc3a9ff),
              ).lerp(0.75),
              value: ((totalWants / wants) * 100) * 0.3,
              title:
                  '${(((totalWants / wants) * 100) * 0.3).toStringAsFixed(2)} %',
              radius: radius,
              titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: ColorTween(
                begin: const Color(0xff151515),
                end: const Color(0xff8dffe4),
              ).lerp(0.75),
              value: 100 -
                  ((((totalNeeds / needs) * 100) * 0.5) +
                      (((totalWants / wants) * 100) * 0.3)),
              title:
                  '${(100 - ((((totalNeeds / needs) * 100) * 0.5) + (((totalWants / wants) * 100) * 0.3))).toStringAsFixed(2)} %',
              radius: radius,
              titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
                shadows: shadows,
              ),
            );
          default:
            throw Exception('Oh no');
        }
      },
    );
  }
}

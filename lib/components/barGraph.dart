import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartValues extends StatelessWidget {
  BarChartValues({super.key});

  final savingsColor = ColorTween(
    begin: const Color(0xff151515),
    end: const Color(0xff8dffe4),
  ).lerp(0.75);
  final miscColor = ColorTween(
    begin: const Color(0xff151515),
    end: const Color(0xffc3a9ff),
  ).lerp(0.75);
  final expenseColor = ColorTween(
    begin: const Color(0xff151515),
    end: const Color(0xffc9ff99),
  ).lerp(0.75);
  final betweenSpace = 0;

  BarChartGroupData generateGroupData(
    int x,
    double savings,
    double misc,
    double expense,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: savings,
          color: savingsColor,
          width: 6,
        ),
        BarChartRodData(
          fromY: savings + betweenSpace,
          toY: savings + betweenSpace + misc,
          color: miscColor,
          width: 6,
        ),
        BarChartRodData(
          fromY: savings + betweenSpace + misc + betweenSpace,
          toY: savings + betweenSpace + misc + betweenSpace + expense,
          color: expenseColor,
          width: 6,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10, color: Colors.white);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 * screenScaling(context),
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 20,
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  barGroups: [
                    generateGroupData(0, 20, 30, 50),
                    generateGroupData(1, 45, 15, 40),
                    generateGroupData(2, 60, 10, 30),
                    generateGroupData(3, 45, 20, 35),
                    generateGroupData(4, 65, 5, 30),
                    generateGroupData(5, 50, 10, 40),
                    generateGroupData(6, 50, 15, 35),
                    generateGroupData(7, 29, 25, 46),
                    generateGroupData(8, 46, 26, 28),
                    generateGroupData(9, 46, 20, 34),
                    generateGroupData(
                        10,
                        100 -
                            ((((totalNeeds / needs) * 100) * 0.5) +
                                (((totalWants / wants) * 100) * 0.3)),
                        ((totalWants / wants) * 100) * 0.3,
                        ((totalNeeds / needs) * 100) * 0.5),
                    generateGroupData(11, 100, 0, 0),
                  ],
                  maxY: 100,
                  extraLinesData: ExtraLinesData(horizontalLines: [
                    HorizontalLine(
                      y: 20,
                      color: Colors.red,
                      strokeWidth: 1,
                    ),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}

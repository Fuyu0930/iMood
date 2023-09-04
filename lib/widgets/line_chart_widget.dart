import 'package:fl_chart/fl_chart.dart';
import 'package:imood/widgets/line_titles.dart';
import 'package:flutter/material.dart';

// Tutorial of using building line chart reference: https://youtu.be/LB7B3zudivI
class LineChartWidget extends StatelessWidget {
  // Set up the color
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff23b6e6),
  ];
  @override
  Widget build(BuildContext context) => LineChart(
        // In this demo, we hardtype the data of the chart
        // First, set up the range
        LineChartData(
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 50,
          titlesData: LineTitles.getTitleData(),
          // Do not show the grid
          gridData: FlGridData(
            show: false,
          ),
          // Show the border
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 2),
          ),
          // Type the data
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 10),
                FlSpot(2, 20),
                FlSpot(4, 15),
                FlSpot(6, 30),
                FlSpot(8, 5),
                FlSpot(10, 10),
                FlSpot(12, 12),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}

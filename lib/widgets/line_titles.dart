import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// This widget will return the title and labels of the linechart
// Tutorial of using building line chart reference: https://youtu.be/LB7B3zudivI
class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          getTextStyles: (value) => const TextStyle(
            fontFamily: 'SourceSansPro',
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          // Type the x-axis label
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '3:00';
              case 4:
                return '7:00';
              case 8:
                return '11:00';
              case 12:
                return '13:00';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            fontFamily: 'SourceSansPro',
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            // Type the y-axis label
            switch (value.toInt()) {
              case 10:
                return '10';
              case 20:
                return '20';
              case 30:
                return '30';
              case 40:
                return '40';
            }
            return '';
          },
          reservedSize: 35,
          margin: 8,
        ),
      );
}

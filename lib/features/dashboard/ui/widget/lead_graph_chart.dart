import 'package:dentsu_test/util/util_barrel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../features_barrel.dart';

class LeadsLineGraph extends StatelessWidget {
  const LeadsLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 200/140,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 0),
                FlSpot(2, 1),
                FlSpot(3, 3),
                FlSpot(4, 3.5),
                FlSpot(5, 4),
                FlSpot(6, 3),
                FlSpot(7, 4),
              ],
              color: theme.colorScheme.secondary,
              dotData: const FlDotData(
                show: false,
              ),
            ),
            LineChartBarData(
              spots: const [
                FlSpot(1, 0),
                FlSpot(2, 1.2),
                FlSpot(3, 1),
                FlSpot(4, 3),
                FlSpot(5, 3.5),
                FlSpot(6, 2.5),
                FlSpot(7, 2),
              ],
              color: creditColor,
              dotData: const FlDotData(
                show: false,
              ),
            ),
            LineChartBarData(
              spots: const [
                FlSpot(1, 0),
                FlSpot(2, 0.5),
                FlSpot(3, 0.8),
                FlSpot(4, 1.5),
                FlSpot(5, 1.0),
                FlSpot(6, 2.75),
                FlSpot(7, 3),
              ],
              color: alternativeGradientColor,
              dotData: const FlDotData(
                show: false,
              ),
            ),
          ],
          titlesData: const FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: const FlGridData(
            show: false,
          ),
          minX: 1,
          minY: 0,
        ),
        duration: const Duration(milliseconds: 150), // Optional
        curve: Curves.linear, // Optional
      ),
    );
  }

}

class SideCustomTitleWidgets extends StatelessWidget {
  final double value;
  final TitleMeta meta;
  final List<LeadsAnalytics>? leadsAnalytics;

  const SideCustomTitleWidgets({super.key, required this.value, required this.meta, this.leadsAnalytics});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10,
        color: theme.colorScheme.tertiary
    );

    if(leadsAnalytics != null){
      LeadsAnalytics leadAnalytics = leadsAnalytics?[value.toInt() - 1] ?? LeadsAnalytics();
      String text = leadAnalytics.date ?? '';
      return RotatedBox(quarterTurns: 3, child: Text(text, style: style));
    }
    else {
      String text = '${value.toInt()}';

      return Text(text, style: style);
    }
  }
}
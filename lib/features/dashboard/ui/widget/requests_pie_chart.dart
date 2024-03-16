import 'package:dentsu_test/util/util_barrel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RequestsPieChart extends StatelessWidget {
  const RequestsPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 200/130,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 120,
              color: alternativeGradientColor,
              radius: 80,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 120,
              color: theme.colorScheme.secondary,
              radius: 80,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 120,
              color: creditColor,
              radius: 80,
              showTitle: false,
            ),

          ],
          sectionsSpace: 0,
          centerSpaceRadius: 0
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }
}

import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/constants_barrel.dart';

class TotalLeadProgressBar extends StatelessWidget {
  final double totalLeads;
  final double contactedLeads;

  const TotalLeadProgressBar({super.key, required this.totalLeads, required this.contactedLeads});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var percentage = (contactedLeads / totalLeads) * 100;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              shape: BoxShape.circle
          ),
          child: Center(child: CustomTextWidget(
              text: "${percentage.toInt()}%", fontSize: 22, color: theme.colorScheme.onSecondary,
              fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          height: 140,
          width: 140,
          child: CircularProgressIndicator(
            value: percentage/100,
            strokeWidth: 10,
            backgroundColor: indicatorBackgroundColor,
            color:  theme.colorScheme.secondary,
            strokeCap: StrokeCap.round,
          ),
        )
      ],
    );
  }
}

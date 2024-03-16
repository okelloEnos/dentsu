import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/common_widget_barrel.dart';

class TopProducts extends StatelessWidget {
  final String title;
  final double numberOfRequests;
  final double totalRequests;
  final Color backgroundColor;
  final Color activeColor;
  const TopProducts({super.key, required this.title,
    required this.numberOfRequests, required this.totalRequests, required this.backgroundColor, required this.activeColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double percentage = numberOfRequests / totalRequests;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(text: title,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.tertiary,
            ),
            CustomTextWidget(text: thousandNumberFormat("$numberOfRequests"),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: activeColor,
            ),
          ],
        ),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(activeColor),
          borderRadius: BorderRadius.circular(10.0),
          minHeight: 6,
        ),
      ],
    );
  }
}

import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/common_widget_barrel.dart';
import '../../../../util/constants/constants_barrel.dart';

class GraphLeadsStat extends StatelessWidget {
  const GraphLeadsStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(text: "Leads",
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.tertiary,
                ),
                Icon(Icons.more_horiz, color: theme.hintColor.withOpacity(0.5))
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    CustomTextWidget(text: "Accounts",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: creditColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    CustomTextWidget(text: "Credit",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: alternativeGradientColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    CustomTextWidget(text: "Insurance",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Center(child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 0.0),
              child: LeadsLineGraph(),
            )),
          ],
        ),
      ),
    );
  }
}

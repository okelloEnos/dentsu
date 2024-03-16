import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/constants_barrel.dart';

class TopProductsStats extends StatelessWidget {
  const TopProductsStats({super.key});
  // Every large design company whether it’s a multi-national branding.
  // Mortgage(14px 400, tertiary) -> 65,376(14px 400, #863AAC) #863AAC #E5D0F0
  // One Xtra Account(14px 400, tertiary) -> 12,109(14px 400, #4339F2) #4339F2 #DAD7FE
  // Motor Insurance(14px 400, tertiary) -> 132,645(14px 400, #02A0FC) #02A0FC #CCE2EE
  // Credit Cards(14px 400, tertiary) -> 100,429(14px 400, #59BFA3) #59BFA3 #DFFBF3
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double totalRequests = 150000;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(text: "Top Products",
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.tertiary,
                ),
                Icon(Icons.more_horiz, color: theme.hintColor.withOpacity(0.5))
              ],
            ),
            CustomTextWidget(text: "Every large design company whether it’s a multi-national branding.",
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.tertiary.withOpacity(0.4),
            ),
            const SizedBox(height: 30.0),
           TopProducts(
             totalRequests: totalRequests,
              numberOfRequests: 65376,
             title: "Mortgage",
              backgroundColor: mortgageBackgroundColor,
              activeColor: theme.colorScheme.secondary,
           ),
            const SizedBox(height: 20.0),
            TopProducts(
              totalRequests: totalRequests,
              numberOfRequests: 12109,
              title: "One Xtra Account",
              backgroundColor: extraAccountBackgroundColor,
              activeColor: extraAccountActiveColor,
            ),
            const SizedBox(height: 20.0),
             TopProducts(
              totalRequests: totalRequests,
              numberOfRequests: 132645,
              title: "Motor Insurance",
              backgroundColor: motorInsuranceBackgroundColor,
              activeColor: motorInsuranceActiveColor,
            ),
            const SizedBox(height: 20.0),
            TopProducts(
              totalRequests: totalRequests,
              numberOfRequests: 100429,
              title: "Credit Cards",
              backgroundColor: creditBackgroundColor,
              activeColor: alternativeGradientColor,
            ),
          ],
        ),
      ),
    );
  }
}

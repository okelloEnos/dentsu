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
                CustomTextWidget(text: "Top Products",
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.tertiary,
                ),
                Icon(Icons.more_horiz, color: theme.hintColor.withOpacity(0.5))
              ],
            ),
            const SizedBox(height: 30.0),
            const Center(child: TotalLeadProgressBar(totalLeads: 100, contactedLeads: 70)),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    RichText(text: TextSpan(text: "Contacted ", style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                      fontFamily: "DM Sans",
                    ), children: [
                      TextSpan(text: "1.7K", style:
                      TextStyle(     fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.tertiary,
                        fontFamily: "DM Sans",))
                    ]))
                  ],
                ),
                // Sized
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
                        color: indicatorBackgroundColor,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    RichText(text: TextSpan(text: "Total Leads ", style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.tertiary,
                      fontFamily: "DM Sans",
                    ), children: [
                      TextSpan(text: "2.73K", style:
                      TextStyle(     fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.tertiary,
                        fontFamily: "DM Sans",))
                    ]))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

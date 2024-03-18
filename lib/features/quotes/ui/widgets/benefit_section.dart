import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class BenefitSection extends StatelessWidget {
  const BenefitSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: "Benefits",
            fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: theme.colorScheme.tertiary,
            ),
            const SizedBox(height: 20.0),
            const CustomBenefitSwitch(
              title: "Inpatient",
              isProvided: true,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Outpatient",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "No Co-payment",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Dental",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Optical",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Maternity",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Last Expense",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Personal Accident",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Enhanced Covid 19 Cover",
              isProvided: false,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            const CustomBenefitSwitch(
              title: "Amref Evacuation",
              isProvided: false,
            ),
          ],
        ),
      ),
    );
  }
}

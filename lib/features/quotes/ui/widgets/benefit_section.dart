import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class BenefitSection extends StatelessWidget {
  final Quote quote;
  const BenefitSection({Key? key, required this.quote}) : super(key: key);

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
            CustomBenefitSwitch(
              title: "Inpatient",
              isProvided: quote.leadBenefit?.inPatient,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
             CustomBenefitSwitch(
              title: "Outpatient",
              isProvided: quote.leadBenefit?.outPatient,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "No Co-payment",
              isProvided: quote.leadBenefit?.coPayment,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Dental",
              isProvided: quote.leadBenefit?.dental,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
           CustomBenefitSwitch(
              title: "Optical",
              isProvided: quote.leadBenefit?.optical,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Maternity",
              isProvided: quote.leadBenefit?.maternity,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Last Expense",
              isProvided: quote.leadBenefit?.lastExpense,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Personal Accident",
              isProvided: quote.leadBenefit?.personalAccident,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Enhanced Covid 19 Cover",
              isProvided: quote.leadBenefit?.covidCover,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              thickness: 1.0,
            ),
            CustomBenefitSwitch(
              title: "Amref Evacuation",
              isProvided: quote.leadBenefit?.amrefEvacuation,
            ),
          ],
        ),
      ),
    );
  }
}

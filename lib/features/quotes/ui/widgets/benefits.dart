import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';

import '../../../features_barrel.dart';

class BenefitsWidget extends StatelessWidget {
  final Quote quote;
  const BenefitsWidget({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          QuoteDataContent(
            title: "Inpatient Cover Limit",
            data: "KES ${thousandNumberFormat("${quote.inPatientCoverLimit}")}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 10.0),
          BenefitSection(
            quote: quote,
          ),
          const SizedBox(height: 40.0),
          PaymentSection(
            quote: quote,
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

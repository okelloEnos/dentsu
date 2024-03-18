import 'package:dentsu_test/util/util_barrel.dart';
import 'package:flutter/material.dart';

import '../../../features_barrel.dart';

class Benefits extends StatelessWidget {
  const Benefits({Key? key}) : super(key: key);

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
            data: "KES ${thousandNumberFormat("1000000")}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 10.0),
          const BenefitSection(),
          const SizedBox(height: 40.0),
          const PaymentSection(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

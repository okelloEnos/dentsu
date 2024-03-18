import 'package:flutter/material.dart';

import '../../../../util/functions/function_barrel.dart';
import '../../../features_barrel.dart';

class SetUp extends StatelessWidget {
  const SetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          QuoteDataContent(
            title: "Age Bracket",
            data: "18 to 30 years",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Inpatient Cover Limit",
            data: "KES ${thousandNumberFormat("500000")}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Spouse Covered?",
            data: "Yes",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "How many children?",
            data: "6 children",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Cover Children?",
            data: "Yes",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Spouse Age Bracket",
            data: "18 to 30 years",
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

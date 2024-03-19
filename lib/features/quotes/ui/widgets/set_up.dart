import 'package:flutter/material.dart';

import '../../../../util/functions/function_barrel.dart';
import '../../../features_barrel.dart';

class SetUp extends StatelessWidget {
  final Quote quote;
  const SetUp({Key? key, required this.quote}) : super(key: key);

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
            data: "${quote.ageBracket}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Inpatient Cover Limit",
            data: "KES ${thousandNumberFormat("${quote.inPatientCoverLimit}")}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Spouse Covered?",
            data: "${quote.spouseCovered}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "How many children?",
            data: "${quote.numberOfChildren} children",
          ),
          const SizedBox(height: 15.0),
           QuoteDataContent(
            title: "Cover Children?",
            data: "${quote.childrenCovered}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Spouse Age Bracket",
            data: "${quote.spouseAgeBracket}",
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

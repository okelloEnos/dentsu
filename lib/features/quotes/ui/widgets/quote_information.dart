import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class QuoteInformation extends StatelessWidget {
  final Quote quote;
  const QuoteInformation({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          QuoteDataContent(
            title: "First Name",
            data: "${quote.clientFirstName}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Middle Name",
            data: "${quote.clientMiddleName}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Last Name",
            data: "${quote.clientLastName}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Originating Lead Source",
            data: "${quote.originatingLeadSource}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Qoute ID",
            data: "QUO-${quote.id}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Owning Business Unit",
            data: "${quote.owningBusinessUnit}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Lead ID",
            data: "LD-${quote.leadId}",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Source",
            data: "${quote.source}",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Capturing User",
            data: "${quote.capturingUser}",
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

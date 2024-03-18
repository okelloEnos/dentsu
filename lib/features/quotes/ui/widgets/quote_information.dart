import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class QuoteInformation extends StatelessWidget {
  const QuoteInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          const QuoteDataContent(
            title: "First Name",
            data: "Stacey",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Middle Name",
            data: "Nyawira",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Last Name",
            data: "Waruguru",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Originating Lead Source",
            data: "Sales Agent",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Qoute ID",
            data: "QUO-87867-V2",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Owning Business Unit",
            data: "Kenya",
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Lead ID",
            data: "0",
          ),
          const SizedBox(height: 15.0),
          QuoteDataContent(
            title: "Source",
            data: "Agent portal",
            suffixIcon: Icon(Icons.keyboard_arrow_down_sharp, color: theme.colorScheme.tertiary.withOpacity(0.4), size: 20,),
          ),
          const SizedBox(height: 15.0),
          const QuoteDataContent(
            title: "Capturing User",
            data: "Jeremy Kibor",
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

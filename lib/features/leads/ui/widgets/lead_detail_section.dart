import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class LeadDetailSection extends StatelessWidget {
  const LeadDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeadDataWidget(
              title: "Lead Source",
              data: "Bulk Upload"),
          SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Product Requested",
              data: "Mortgage"),
          SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Product Sold",
              data: "Mortgage Account"),
          SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Lead Close Reason",
              data: "Lost to competition"),
          SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Recording Agent",
              data: "Khary Fagbure"),
        ],
      ),
    );
  }
}

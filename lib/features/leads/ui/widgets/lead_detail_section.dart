import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class LeadDetailSection extends StatelessWidget {
  final Lead lead;
  const LeadDetailSection({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          LeadDataWidget(
              title: "Lead Source",
              data: "${lead.leadSource}"),
          const SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Product Requested",
              data: "${lead.productRequested}"),
          const SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Product Sold",
              data: "${lead.productRequested} Account"),
          const SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Lead Close Reason",
              data: (lead.leadCloseReason != null && lead.leadCloseReason != "null" && (lead.leadCloseReason?.isEmpty ?? false)) ? "${lead.leadCloseReason}" : ""),
          const SizedBox(height: 10.0),
          LeadDataWidget(
              title: "Recording Agent",
              data: "${lead.recordingAgentName}"),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}

import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

import '../../../features_barrel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              CustomTextWidget(text: "Dashboard",
              fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary.withOpacity(0.8),
              ),
              const SizedBox(height: 10.0),
              const SizedBox(
                  height: 280.0,
                  child: DashboardStats()),
              const SizedBox(height: 20.0),
              CustomTextWidget(text: "New Leads",
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary.withOpacity(0.8),
              ),
              const SizedBox(height: 10.0),
              const NewLeads()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "Leads",
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.tertiary.withOpacity(0.8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomElevatedButton(
                        btnText: "+  New lead",
                        onPressed: () {
                          context.go('/dashboard/add_lead');
                        },
                        btnColor: theme.colorScheme.secondary,
                        textColor: theme.colorScheme.onTertiary,
                        fontWeight: FontWeight.w400,
                        textFontSize: 16.0,
                        radius: 90.0,
                      ),
                      const SizedBox(width: 15.0),
                      Icon(Icons.more_horiz,
                          color: theme.hintColor.withOpacity(0.5)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const NewLeads(),
            ],
          ),
        ),
      ),
    );
  }
}

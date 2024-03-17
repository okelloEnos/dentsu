import 'package:dentsu_test/common_widgets/custom_text.dart';
import 'package:dentsu_test/common_widgets/user_photo.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:flutter/material.dart';

class LeadDetailCard extends StatelessWidget {
  const LeadDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 40.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UserPhoto(userProfilePhoto: imageUrl),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget(text: "Joseph Kimeu Walter",
                    fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.tertiary,
                    ),
                    // const SizedBox(height: 10.0),
                    CustomTextWidget(text: "Nairobi, Kenya",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.tertiary.withOpacity(0.4),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const LeadDataWidget(
                title: "Lead Created",
                data: "10 August 2022",
                isShowBorder: true),
            const SizedBox(height: 10.0),
            const LeadDataWidget(
                title: "Lead Contacted",
                data: "16 August 2022",
                isShowBorder: true),
            const SizedBox(height: 10.0),
            const LeadDataWidget(
                title: "Next Appointment",
                data: "29 August 2022",
                isShowBorder: true),
          ],
        ),
      ),
    );
  }
}

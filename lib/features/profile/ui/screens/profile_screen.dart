import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features_barrel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          ProfilePhoto(imageUrl: imageUrl),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                SizedBox(height: 20.0),
                ProfileDataContent(
                  title: "Ful Names",
                  data: "Okello Enos Otieno",
                ),
                SizedBox(height: 15.0),
                ProfileDataContent(
                  title: "Dentu's ID",
                  data: "dui-87867-V2",
                ),
                SizedBox(height: 15.0),
                ProfileDataContent(
                  title: "Phone Number",
                  data: "0716229563",
                ),
                SizedBox(height: 15.0),
                ProfileDataContent(
                  title: "Location",
                  data: "Nairobi, Kenya",
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: CustomElevatedButton(btnText: "Log Out",
                btnColor: theme.colorScheme.secondary,
                textColor: theme.colorScheme.onSecondary,
                fontWeight: FontWeight.w700,
                textFontSize: 16.0,
                radius: 90.0,
                onPressed: (){
              context.go('/login');
                }),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

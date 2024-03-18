import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features_barrel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    var theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state is ProfileSuccess){
            Profile profile = state.profile;
            return Column(
              children: [
                ProfilePhoto(imageUrl: profile.profileImage ?? ""),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      ProfileDataContent(
                        title: "Ful Names",
                        data: "${profile.firstName} ${profile.middleName} ${profile.lastName}",
                      ),
                      const SizedBox(height: 15.0),
                     ProfileDataContent(
                        title: "Dentu's ID",
                        data: "${profile.id}",
                      ),
                      const SizedBox(height: 15.0),
                      ProfileDataContent(
                        title: "Phone Number",
                        data: "${profile.phoneNumber}",
                      ),
                      const SizedBox(height: 15.0),
                      ProfileDataContent(
                        title: "Email",
                        data: "${profile.email}",
                      ),
                      const SizedBox(height: 15.0),
                      ProfileDataContent(
                        title: "Location",
                        data: "${profile.location}",
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
                      onPressed: () {
                        context.go('/login');
                      }),
                ),
                const SizedBox(height: 10.0),
              ],
            );
          }
          else if(state is ProfileFailure){

            return Center(
              child: CustomTextWidget(
                text: state.errorMessage,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.error,
                textAlign: TextAlign.center,),
            );
          }
          else if(state is ProfileLoading){
            return Center(child: CircularSpinProgress());
          }
          else{
            return Center(
              child: CustomTextWidget(
                text: "An error occurred",
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.error,
                textAlign: TextAlign.center,),
            );
          }

        },
      ),
    );
  }
}

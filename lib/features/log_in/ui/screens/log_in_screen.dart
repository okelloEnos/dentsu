import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dentsu_test/common_widgets/page_builder.dart';

import '../../../../../common_widgets/common_widget_barrel.dart';
import '../../login_barrel.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        var actionSelected = await showAnimatedDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Do you wish to exit the app?',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    color: theme.colorScheme.primary),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context, true),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.error,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0))),
                            child: Center(
                              child: Text('Yes',
                                  style: theme.textTheme.displayMedium),
                            ),
                          )),
                      GestureDetector(
                          onTap: () => Navigator.pop(context, false),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0))),
                            child: Center(
                              child: Text('No',
                                  style: theme.textTheme.displayMedium),
                            ),
                          ))
                    ],
                  ),
                ),
                // GestureDetector(
                //     onTap: () => Navigator.pop(context, true),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: theme.colorScheme.error,
                //           borderRadius: const BorderRadius.all(
                //               Radius.circular(5.0))),
                //       child: Center(
                //         child: Text('Yes',
                //             style: theme.textTheme.displayMedium),
                //       ),
                //     )),
                // GestureDetector(
                //     onTap: () => Navigator.pop(context, false),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: theme.colorScheme.primary,
                //           borderRadius:
                //           const BorderRadius.all(Radius.circular(5.0))),
                //       child: Center(
                //         child: Text('No',
                //             style: theme.textTheme.displayMedium),
                //       ),
                //     ))
              ],
            );
          },
          animationType: DialogTransitionType.slideFromTop,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        );

        return actionSelected ?? false;
      },
      child: ColoredSafeArea(
        color: theme.colorScheme.tertiary,
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: BackgroundImageWidget(
            child: CustomPageBuilder(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // const UpperViewWidget(
                  //   assetName: "happy_avatar_logo.png",
                  //   subTitle: "Login",
                  //   description: "Login to your account",
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                 const Padding(
                   padding: EdgeInsets.only(left: 10.0, right: 10.0),
                   child: TopWidget(
                     title: "Login to your\nPesaKit account",
                   ),
                 ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: CustomInputTextWidget(
                      text: "Phone number",
                    ),
                  ),
                  Row()
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //   child: CustomTextField(
                  //     controller: phoneNumberController,
                  //     keyboardType: TextInputType.phone,
                  //     hintText: "Enter your phone number",
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  //   child: CustomInputTextWidget(
                  //     text: "Secret PIN",
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //   child: CustomTextField(
                  //     controller: passwordController,
                  //     keyboardType: TextInputType.visiblePassword,
                  //     hintText: "Enter your secret PIN",
                  //     obscureText: hidePassword,
                  //     suffixIcon: GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             hidePassword = !hidePassword;
                  //           });
                  //         },
                  //         child: hidePassword
                  //             ? const Icon(
                  //           Icons.visibility_off,
                  //           color: Colors.grey,
                  //         )
                  //             : const Icon(
                  //           Icons.visibility,
                  //           color: Colors.grey,
                  //         )),
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //   const EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
                  //   child: BlocConsumer<LogInBloc, LogInState>(
                  //     builder: (context, state) {
                  //       if (state is LogInLoading) {
                  //         return const SubmissionProgress(
                  //             submissionText: "Checking Credentials...");
                  //       } else {
                  //         return CustomElevatedButton(
                  //             btnText: "Log in",
                  //             btnColor: theme.colorScheme.tertiary,
                  //             radius: 40.0,
                  //             onPressed: () {
                  //               context.read<LogInBloc>().add(LogInPressedEvent(
                  //                   phoneNumber: phoneNumberController.text,
                  //                   pin: passwordController.text));
                  //             });
                  //       }
                  //     },
                  //     listener: (context, state) {
                  //       if (state is LogInSuccess) {
                  //         // context.read<ProfileBloc>().add(ProfileFromLogInEvent(profile: state.userProfile));
                  //         // context.read<DashboardBloc>().add(FetchDashboardEvent());
                  //         // context.read<LoadLeadBloc>().add(FetchMyLeadsEvent(isConnected: context.read<NetworkBloc>().state == NetworkStatus.on));
                  //         // context.read<CommissionBloc>().add(FetchCommissionsEvent(
                  //         //     isConnected: context.read<NetworkBloc>().state == NetworkStatus.on
                  //         // ));
                  //         // context.read<RenumerationCubit>().fetchRenumerations();
                  //         context.goNamed('home');
                  //       } else if (state is LogInFailure) {
                  //         showErrorDialog(
                  //             context: context,
                  //             buttonPressed: () => context.pop(),
                  //             title: "Log In Failed",
                  //             description: state.errorMessage);
                  //       }
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //       onPressed: () {
                  //         context.goNamed(
                  //           'forgot_password',
                  //         );
                  //       },
                  //       child: Text(
                  //         "Forgot your secret PIN?",
                  //         style: theme.textTheme.labelMedium,
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

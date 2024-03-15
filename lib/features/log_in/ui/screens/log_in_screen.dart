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
  bool keepMeLoggedIn = false;

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
                    fontFamily: 'Dm Sans',
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
        color: theme.colorScheme.primary,
        child: Scaffold(
          backgroundColor: theme.colorScheme.primary,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: CustomPageBuilder(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  Center(child: Image.asset("assets/images/logo.png", height: 63, width: 98.67)),
                  const SizedBox(
                    height: 40.0,
                  ),
                          Center(
                            child: CustomTextWidget(text: "Welcome to Dentsu LMS",
                              fontSize: 28.0,
                              color: theme.colorScheme.onPrimary,
                              fontFamily: "Dm Sans",
                              fontWeight: FontWeight.w700,),
                          ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: CustomTextWidget(text:"A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale", textAlign: TextAlign.center,
                        color: theme.colorScheme.onPrimary,
                        fontFamily: "Dm Sans",
                        fontWeight: FontWeight.w400,),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 5.0),
                    child: CustomTextWidget(
                      text: "Username",
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomTextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    hintText: "Enter your email or Username",
                    color: theme.colorScheme.onPrimary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: CustomTextWidget(
                      text: "Password",
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    color: theme.colorScheme.onPrimary,
                    hintText: "Enter your Password",
                    obscureText: hidePassword,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: hidePassword
                            ? const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )
                            : const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              keepMeLoggedIn = !keepMeLoggedIn;
                            });
                          },
                          child: keepMeLoggedIn ? Image.asset("assets/images/marked_checkbox.png", height: 24, width: 24,) : Icon(Icons.check_box_outline_blank,
                              color: theme.colorScheme.onPrimary),
                        ),
                        const SizedBox(width: 6.0,),
                        CustomTextWidget(
                          text: "Keep me logged in",
                          color: theme.colorScheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<LogInBloc, LogInState>(
                    builder: (context, state) {
                      if (state is LogInLoading) {
                        return const SubmissionProgress(
                            submissionText: "Checking Credentials...");
                      } else {
                        return CustomElevatedButton(
                            btnText: "Log In",
                            btnColor: theme.colorScheme.onPrimary,
                            textColor: theme.colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                            radius: 90.0,
                            onPressed: () {
                              // context.read<LogInBloc>().add(LogInPressedEvent(
                              //     phoneNumber: phoneNumberController.text,
                              //     pin: passwordController.text));
                            });
                      }
                    },
                    listener: (context, state) {
                      if (state is LogInSuccess) {
                        // context.read<ProfileBloc>().add(ProfileFromLogInEvent(profile: state.userProfile));
                        // context.read<DashboardBloc>().add(FetchDashboardEvent());
                        // context.read<LoadLeadBloc>().add(FetchMyLeadsEvent(isConnected: context.read<NetworkBloc>().state == NetworkStatus.on));
                        // context.read<CommissionBloc>().add(FetchCommissionsEvent(
                        //     isConnected: context.read<NetworkBloc>().state == NetworkStatus.on
                        // ));
                        // context.read<RenumerationCubit>().fetchRenumerations();
                        context.goNamed('home');
                      } else if (state is LogInFailure) {
                        showErrorDialog(
                            context: context,
                            buttonPressed: () => context.pop(),
                            title: "Log In Failed",
                            description: state.errorMessage);
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

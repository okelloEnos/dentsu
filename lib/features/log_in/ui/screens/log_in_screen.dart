import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/main.dart';
import 'package:dentsu_test/util/util_barrel.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  bool keepMeLoggedIn = false;

  @override
  void initState() {
    super.initState();
    keepMeLoggedIn = sharedPreferences.getBool(keepMeLoggedInValue) ?? false;
  }

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
                      Expanded(
                        child: GestureDetector(
                            onTap: () => context.pop(true),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.error,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Center(
                                child: CustomTextWidget(
                                  text: "Yes",
                                  color: theme.colorScheme.onError,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => context.pop(false),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.secondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: Center(
                                child: CustomTextWidget(
                                  text: "No",
                                  color: theme.colorScheme.onSecondary,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      )
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
                  Center(
                      child: Image.asset("assets/images/logo.png",
                          height: 63, width: 98.67)),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: CustomTextWidget(
                      text: "Welcome to Dentsu LMS",
                      fontSize: 28.0,
                      color: theme.colorScheme.onPrimary,
                      fontFamily: "Dm Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: CustomTextWidget(
                      text:
                          "A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale",
                      textAlign: TextAlign.center,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w400,
                    ),
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
                    controller: emailController,
                    textColor: theme.colorScheme.primary,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter your email or Username",
                    filledColor: theme.colorScheme.onPrimary,
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
                    filledColor: theme.colorScheme.onPrimary,
                    textColor: theme.colorScheme.primary,
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
                          child: keepMeLoggedIn
                              ? Image.asset(
                                  "assets/images/marked_checkbox.png",
                                  height: 24,
                                  width: 24,
                                )
                              : Icon(Icons.check_box_outline_blank,
                                  color: theme.colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
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
                            fontWeight: FontWeight.w700,
                            radius: 90.0,
                            textFontSize: 16.0,
                            onPressed: () {
                              final String email = emailController.text.trim();
                              final String password =
                                  passwordController.text.trim();

                              if (email.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: CustomTextWidget(
                                    text:
                                        "Your email address is missing, add email address to continue.",
                                    color: theme.colorScheme.onError,
                                  ),
                                  backgroundColor: theme.colorScheme.error,
                                  duration: const Duration(seconds: 3),
                                ));
                              } else if (password.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: CustomTextWidget(
                                    text:
                                        "Your password is missing, add password to continue.",
                                    color: theme.colorScheme.onError,
                                  ),
                                  backgroundColor: theme.colorScheme.error,
                                  duration: const Duration(seconds: 3),
                                ));
                              } else {
                                context.read<LogInBloc>().add(LogInPressedEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                              }
                            });
                      }
                    },
                    listener: (innerContext, state) {
                      if (state is LogInSuccess) {
                        // fetch user details
                        context.read<ProfileBloc>().add(FetchProfileEvent(
                            userId: state.userId));
                        sharedPreferences.setBool(
                            keepMeLoggedInValue, keepMeLoggedIn);
                        context.read<LeadsBloc>().add(FetchAllLeadsEvent());
                        context.read<QuotesBloc>().add(FetchAllQuotesEvent());

                        context.goNamed('dashboard');
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

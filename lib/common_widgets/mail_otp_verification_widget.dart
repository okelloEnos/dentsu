import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../features/timer/timer_bloc.dart';
import '../features/timer/timer_events.dart';
import '../features/timer/timer_state.dart';
import '../util/functions/values_conversion.dart';

class MailOtpVerificationWidget extends StatefulWidget {
  final VoidCallback onValidationSuccess;
  final String? text;

  const MailOtpVerificationWidget({super.key, required this.onValidationSuccess, this.text});

  @override
  MailOtpVerificationWidgetState createState() => MailOtpVerificationWidgetState();
}

class MailOtpVerificationWidgetState extends State<MailOtpVerificationWidget> {
  final otpCodeController = TextEditingController();
  String email = "";

  @override
  void initState() {
    email = "enosokello@gmail.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MailMobileOtpWidget(
      text: widget.text,
      email: email,
      controller: otpCodeController,
      onValidationSuccess: widget.onValidationSuccess,);
  }
}

class MailMobileOtpWidget extends StatelessWidget {
  final VoidCallback onValidationSuccess;
  final String? text;
  final String? email;
  final TextEditingController controller;
  const MailMobileOtpWidget({super.key, required this.onValidationSuccess, this.email, this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(height: 32.0,),
        CustomTextWidget(
          text: text ?? "We have sent an email with your verification code to ${(email ?? "")}.",
          color: theme.colorScheme.tertiary,
        ),
        const SizedBox(height: 32.0,),
        BlocBuilder<TimerBloc, TimerState>(
  builder: (context, state) {
    if(state is MailOtpValidationInProgress){
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "Validating OTP ...",
            color: theme.colorScheme.tertiary,
          ),
          const SizedBox(width: 2.0,),
          const SizedBox(
              height: 50.0,
              width: 50.0,
              child: PageLoader())
        ],
      );
    } else {
      return CustomTextWidget(
        text: "Enter OTP",
        fontWeight: FontWeight.w700,
        color: theme.colorScheme.tertiary,
      );
    }
  },
),
        const SizedBox(height: 16.0,),
        BlocConsumer<TimerBloc, TimerState>(
  listener: (context, state) {
    if(state is MailOtpValidationOnSuccess){
      onValidationSuccess();
    }
    else if(state is MailOtpValidationOnFailure){
      showErrorDialog(
          context: context,
          buttonPressed: () {
            context.pop();
          },
          title: "OTP Verification",
          description: state.errorText
      );
    }
  },
  builder: (context, state) {
    return OtpField(
          controller: controller,
          validatePin: false,
          onCompletion: (value) {
context.read<TimerBloc>().add(MailOtpValidationEvent(email: email ?? "", code: value));
          },);
  },
),
        const SizedBox(height: 8.0,),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: state is TimerRunInProgress ? null : () {
                  context.read<TimerBloc>().add(ResendMailOtpEvent(email: email ?? ""));
                }, child: CustomTextWidget(text: "Resend code",
                  color: state is TimerRunInProgress ? theme.hintColor : theme.colorScheme.primary,
                )),
                Row(
                  children: [
                    CustomTextWidget(
                      text: state is TimerRunInProgress
                          ? "Your token expires in " : "",
                      color: theme.colorScheme.tertiary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomTextWidget(text: "0${(state.duration.toInt() ~/ 60)}:${preserveLeadingZero((state.duration % 60))}",
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class PageLoader extends StatelessWidget {

  final double? size;
  final Color? color;

  const PageLoader({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SpinKitRipple(
      color: color ?? theme.colorScheme.primary,
      size: size ?? 100.0,
    );
  }
}

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final bool validatePin;
  final bool? focus;
  final Function(String) onCompletion;

  const OtpField({super.key, required this.controller, required this.validatePin, required this.onCompletion, this.focus});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      appContext: context,
      controller: controller,
      length: 6,
      obscureText: false,
      blinkWhenObscuring: false,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 6) {
          return "";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          // fieldHeight: 64,
          // fieldWidth: 54,
          activeFillColor: theme.colorScheme.onPrimary,
          inactiveFillColor: theme.colorScheme.onPrimary,
          inactiveColor: validatePin ? theme.colorScheme.error :  theme.colorScheme.tertiary.withOpacity(0.25),
          activeColor: validatePin ? theme.colorScheme.error :  theme.colorScheme.tertiary.withOpacity(0.25),
          selectedColor:  validatePin ? theme.colorScheme.error : theme.colorScheme.tertiary.withOpacity(0.25),
          selectedFillColor: theme.colorScheme.onPrimary,
          borderWidth: 0.4,
          activeBorderWidth: 0.4,
          selectedBorderWidth: 0.4,
          inactiveBorderWidth: 0.4
      ),
      cursorColor:  theme.colorScheme.tertiary,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      onCompleted: onCompletion,
      onChanged: (value) {
      },
      separatorBuilder: (_, __) => const SizedBox(width: 2.0,),
    );
  }
}
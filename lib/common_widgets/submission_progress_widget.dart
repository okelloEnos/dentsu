import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class SubmissionProgress extends StatelessWidget {
  final String submissionText;
  final Color? textColor;
  final Color? progressBackgroundColor;
  final Color? progressColor;
  const SubmissionProgress({super.key, required this.submissionText, this.textColor, this.progressBackgroundColor, this.progressColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: submissionText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor ?? theme.colorScheme.onPrimary,
          ),
          const SizedBox(height: 5.0,),
          const LinearProgressIndicator(

          ),
        ],
      ),
    );
  }
}

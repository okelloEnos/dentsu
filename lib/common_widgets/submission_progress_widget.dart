import 'package:flutter/material.dart';

class SubmissionProgress extends StatelessWidget {
  final String submissionText;
  const SubmissionProgress({super.key, required this.submissionText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(submissionText, style: TextStyle(fontSize: 16, color: theme.colorScheme.primary,
              fontFamily: 'Dm Sans'),),
          const SizedBox(height: 5.0,),
          const LinearProgressIndicator(),
        ],
      ),
    );
  }
}

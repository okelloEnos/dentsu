import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class ProfileDataContent extends StatelessWidget {
  final String? title;
  final String? data;
  final Widget? suffixIcon;
  const ProfileDataContent({Key? key, this.title, this.data, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextWidget(
            text: title ?? "",
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.tertiary),
        const SizedBox(height: 4.0),
        ViewDetailContainer(data: data, suffixIcon: suffixIcon)
      ],
    );
  }
}
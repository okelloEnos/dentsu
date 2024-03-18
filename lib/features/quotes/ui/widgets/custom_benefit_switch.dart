import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class CustomBenefitSwitch extends StatelessWidget {
  final String? title;
  final bool? isProvided;

  const CustomBenefitSwitch({super.key, this.title, this.isProvided});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: title ?? "",
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        Switch(
          value: isProvided ?? false,
          onChanged: (value) {},
          activeColor: theme.colorScheme.onSecondary,
          activeTrackColor: theme.colorScheme.secondary,
          inactiveTrackColor: theme.colorScheme.tertiary.withOpacity(0.3),
          inactiveThumbColor: theme.colorScheme.onTertiary,
          trackOutlineWidth: MaterialStateProperty.all(0.0),
          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        )
      ],
    );
  }
}

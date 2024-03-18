import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class ViewDetailContainer extends StatelessWidget {
  final String? data;
  final Widget? suffixIcon;

  const ViewDetailContainer({Key? key, this.data, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.onTertiary,
            border: Border.all(
                color: theme.colorScheme.tertiary.withOpacity(0.1), width: 1.0),
            borderRadius: BorderRadius.circular(6.0)),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
        text: data ?? "",
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        color: theme.colorScheme.tertiary.withOpacity(0.4)),
        suffixIcon ?? const SizedBox.shrink(),
      ],
    ));
  }
}

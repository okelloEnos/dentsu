import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class LeadDataWidget extends StatelessWidget {
  final String? title;
  final String? data;
  final bool? isShowBorder;

  const LeadDataWidget({Key? key, this.title, this.data, this.isShowBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: (isShowBorder ?? false)
            ? Border.all(color: theme.colorScheme.tertiary.withOpacity(0.1))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(
              text: title ?? "",
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.tertiary.withOpacity(0.5)),
          const SizedBox(height: 2.0),
          CustomTextWidget(
              text: data ?? "",
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.tertiary),

        ],
      ),
    );
  }
}

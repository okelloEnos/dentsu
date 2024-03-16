import 'package:dentsu_test/common_widgets/common_widget_barrel.dart';
import 'package:flutter/material.dart';

class PaginationFooter extends StatelessWidget {
  const PaginationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 2.0, bottom: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(text: "Showing 1 to 10 of 100 entries",
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).hintColor.withOpacity(0.8),
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.05)),
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.chevron_left, color: theme.colorScheme.tertiary, size: 22.0,)),
              Container(
                height: 30.0,
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.05)),
                      borderRadius: BorderRadius.circular(100.0),
                      shape: BoxShape.rectangle
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
                        decoration: BoxDecoration(
                            color: index == 0 ? theme.colorScheme.secondary : theme.colorScheme.onSecondary,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: CustomTextWidget(text: "${index + 1}",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: index == 0 ? theme.colorScheme.onTertiary : theme.colorScheme.tertiary,
                          ),
                        ),
                      )
                  )),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.05)),
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.chevron_right, color: theme.colorScheme.tertiary, size: 22.0,)),
            ],
          )
        ],
      ),
    );
  }
}

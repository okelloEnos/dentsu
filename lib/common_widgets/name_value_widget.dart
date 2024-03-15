import 'package:flutter/material.dart';

class NameValueWidget extends StatelessWidget {
  final String? name;
  final String? value;
  const NameValueWidget({super.key, this.name, this.value});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(name ?? "", style: theme.textTheme.bodySmall,),
        Text(value ?? "", style: theme.textTheme.labelMedium,),
      ],
    );
  }
}

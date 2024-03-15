import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isSwitchOn;
  final Function(bool) onSwitchChanged;
  const CustomSwitch({super.key, required this.isSwitchOn, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Switch(
      value: isSwitchOn,
      onChanged: onSwitchChanged,
      activeTrackColor: theme.colorScheme.secondary,
      // thumbColor: MaterialStatePropertyAll(theme.colorScheme.secondary),
      // inactiveTrackColor: Colors.grey.shade400,
      // activeColor: Colors.green,
      // inactiveThumbColor: Colors.purple,
      // trackColor: MaterialStatePropertyAll(white.withOpacity(0.5)),
      // trackOutlineColor: MaterialStatePropertyAll(theme.colorScheme.primary),
      // thumbIcon: const MaterialStatePropertyAll(Icon(Icons.online_prediction, color: Colors.white,)),
    );
  }
}

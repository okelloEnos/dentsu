import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final double? size;
  final double? iconSize;
  final Function(bool) onChange;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final IconData? icon;
  final bool isChecked;
  const CustomCheckBox({super.key, this.size, this.iconSize, required this.onChange,
    this.backgroundColor, this.borderColor, this.iconColor, this.icon, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
          onChange(!isChecked);
      },
      child: AnimatedContainer(
          height: size ?? 28,
          width: size ?? 28,
          duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
      color: isChecked ? backgroundColor ?? Colors.blue : Colors.transparent,
      borderRadius: BorderRadius.circular(2.0),
      border: Border.all(color: borderColor ?? theme.colorScheme.primary, width: 1.5)
      ),
        child: isChecked
            ? Icon(
          icon ?? Icons.check,
          color: iconColor ?? theme.colorScheme.onPrimary,
          size: iconSize ?? 20,
        )
            : null
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  const StatusCard({super.key, required this.title, this.fontSize, this.horizontalPadding, this.verticalPadding });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Color colorStatusCard = Colors.green;

    switch(title.toLowerCase()){
      case "online":
        colorStatusCard = Colors.green;
        break;
      case "offline":
      default:
        colorStatusCard = Colors.red;
    }

    return Card(
        margin: EdgeInsets.zero,
        color: colorStatusCard,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10.0, vertical: verticalPadding ?? 5.0),
          child: Text(title, style: theme.textTheme.displaySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),),
        ));
  }
}
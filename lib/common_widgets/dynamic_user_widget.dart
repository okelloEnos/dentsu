import 'package:flutter/material.dart';

class DynamicStatWidget extends StatelessWidget {
  final Widget topWidget;
  final Widget actualWidget;
  const DynamicStatWidget({super.key, required this.topWidget, required this.actualWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        actualWidget,
        Positioned(
          top: 0,
          right: 0,
          child: topWidget,
        )
      ],
    );
  }
}

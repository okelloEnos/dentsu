import 'package:flutter/material.dart';

class CustomInputTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? topPadding;
  final double? bottomPadding;
  final String? fontFamily;
  const CustomInputTextWidget({Key? key, required this.text, this.color,
    this.fontSize, this.fontWeight, this.topPadding, this.bottomPadding, this.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 10.0, bottom: bottomPadding ?? 5.0),
      child: Text(
          text,
          style: TextStyle(
            color: color ?? Theme.of(context).colorScheme.primary,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize ?? 16.0,
            fontFamily: fontFamily ?? 'Montserrat',
          )),
    );
  }
}

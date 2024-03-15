import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  const CustomTextWidget({Key? key, required this.text, this.color,
    this.fontSize, this.fontWeight, this.fontFamily, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.primary,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 16.0,
          fontFamily: fontFamily ?? 'DM Sans',
        ));
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final Color? textColor;
  
  final double? fontSize;
  final String hintText;
  final double? hintFontSize;
  final Color? borderColor;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool? obscureText;

  const CustomTextField(
      {Key? key,
      required this.controller,
      this.keyboardType,
      this.filledColor,
      this.fontSize,
      required this.hintText,
      this.hintFontSize,
      this.borderColor,
      this.readOnly,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.minLines,
        this.validator,
        this.onChanged,
        this.obscureText,
        this.textColor
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  TextFormField(
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: filledColor ?? theme.colorScheme.primary,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          color: textColor ?? theme.colorScheme.onPrimary,
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? 16.0,
          fontFamily: 'Dm Sans'),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: prefixIcon,
        ) : null,
        suffixIcon: suffixIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: suffixIcon,
        ) : null,
        filled: true,
        fillColor: filledColor ?? theme.colorScheme.primary,
        hintText: hintText,
        hintStyle: TextStyle(
            color: theme.hintColor,
            fontWeight: FontWeight.w400,
            fontSize: hintFontSize ?? 16.0,
            fontFamily: 'Dm Sans'),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? theme.colorScheme.background)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? theme.colorScheme.background)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? theme.colorScheme.background)),
      ) ,
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final Color? btnColor;
  final Color? textColor;
  final double? textFontSize;
final FontWeight? fontWeight;
  final double? radius;

  const CustomElevatedButton({Key? key, required this.btnText, required this.onPressed, this.btnColor,
  this.textColor, this.textFontSize, this.radius, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? theme.colorScheme.onPrimary,
        backgroundColor: btnColor ?? theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(btnText,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: textFontSize ?? 18, fontFamily: "Dm Sans", color: textColor ?? theme.colorScheme.onPrimary, fontWeight: fontWeight ?? FontWeight.normal),),
            ),
          ],
        ),
    );
  }
}

import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final Color? btnColor;
  final Color? textColor;
  final double? textFontSize;
  final bool? withIcon;
  final Widget? icon;
  final double? radius;

  const CustomElevatedButton({Key? key, required this.btnText, required this.onPressed, this.btnColor,
  this.textColor, this.textFontSize, this.withIcon, this.icon, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  (withIcon != null && withIcon!) ? ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: btnColor ?? theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      icon: icon ?? const Icon(Icons.add, size: 20, color: Colors.white,),
      label: Text(btnText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: textFontSize ?? 18, fontFamily: "Montserrat", color: textColor ?? Colors.white),),
    ) : ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
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
      style: TextStyle(fontSize: textFontSize ?? 18, fontFamily: "Montserrat", color: textColor ?? Colors.white),),
            ),
          ],
        ),
    );
  }
}

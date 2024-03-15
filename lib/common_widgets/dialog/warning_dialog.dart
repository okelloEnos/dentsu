import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';


void showWarningDialog({required BuildContext context,
  required VoidCallback buttonPressed,
  required String title,
  required String btnText,
  required String description}){
var theme = Theme.of(context);
  showAnimatedDialog(context: context, builder: (context) => AlertDialog(
    icon: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // color: darkBlueColor.withOpacity(0.1),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Image.asset("assets/images/warning.png", fit: BoxFit.contain, height: 50, width: 50,),
        )),
    title: Text(title,
      style: TextStyle(color: theme.colorScheme.tertiary, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 18.0),),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 16.0),
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
    actionsPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    actions: [
      GestureDetector(
        onTap: buttonPressed,
        child: Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: const BorderRadius.all(Radius.circular(200.0))),
          child: Center(
            child: Text(btnText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Montserrat')
            ),
          ),
        ),
      ),
    ],
  ));
}

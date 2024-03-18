import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: 100.0,
      fit: BoxFit.contain,
    );
  }
}


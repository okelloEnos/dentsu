import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircularSpinProgress extends StatelessWidget {
  Color spinColor;
  double spinSize;
  CircularSpinProgress({Key? key, this.spinColor = Colors.white, this.spinSize = 50.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: spinColor,
      size: spinSize,
    );
  }
}

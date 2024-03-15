import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridCardWidget extends StatelessWidget {
  final Widget child;
  final int delayDuration;
  const GridCardWidget({Key? key, required this.delayDuration, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(child: ScaleAnimation(
        duration: Duration(milliseconds: delayDuration),
        child: FadeInAnimation(child: child)));
  }
}

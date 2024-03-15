import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomFadeInWithDelayWidget extends StatelessWidget {
  final Widget child;
  const CustomFadeInWithDelayWidget({super.key, required  this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
        child: FadeInAnimation(
        delay: const Duration(milliseconds: 30000),
    duration: const Duration(milliseconds: 3000),
        child: child,
        ),
    );
  }
}

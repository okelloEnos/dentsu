import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Background extends StatelessWidget {

  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
            height: height * 0.08,
                right: 0,
                  bottom: 0,
                  left: 0,
                  child: AnimationConfiguration.synchronized(
                    child: SlideAnimation(
                      verticalOffset: 200.0,
                      duration: const Duration(seconds: 2),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: theme.colorScheme.onPrimary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}

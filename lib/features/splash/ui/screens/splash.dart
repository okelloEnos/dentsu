import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import '../widgets/background_splash.dart';
import '../widgets/splash_image.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startNextScreen() {

    if(mounted) {
      context.goNamed("login");
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() {
    const duration = Duration(seconds: 2);
    return Timer(duration, startNextScreen);
  }

  @override
  Widget build(BuildContext context) {
var theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Background(),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: AnimationConfiguration.synchronized(
                child: FadeInAnimation(
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    verticalOffset: -200.0,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimary.withOpacity(0.4),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    theme.colorScheme.onPrimary.withOpacity(0.2),
                                    theme.colorScheme.onPrimary.withOpacity(1),
                                  ],
                                ),
                              ),
                              child: const SplashImage()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(text: 'Dentsu  Leads\n',
                              style: TextStyle(fontFamily: 'Dm Sans', letterSpacing: 4.0 ,fontSize: 30.0, color: theme.colorScheme.onPrimary, fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(text: 'Platform', style: TextStyle(fontFamily: 'Dm Sans', letterSpacing: 4.0 ,fontSize: 30.0, color: theme.colorScheme.onPrimary, fontWeight: FontWeight.w700),)
                              ])),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                          child: RichText(text: TextSpan(text: '@Dentsu ',
                              style: TextStyle(fontFamily: 'DM Sans', letterSpacing: 2.0 ,fontSize: 16.0, color: theme.colorScheme.primary, fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(text: '${DateTime.now().year}',
                                  style: TextStyle(fontFamily: 'DM Sans', letterSpacing: 2.0 ,fontSize: 16.0, color: theme.colorScheme.primary, fontWeight: FontWeight.w700),
                                )
                              ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

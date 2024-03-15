import 'dart:async';
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

  // Future<void> confirmPermission({required BuildContext context}) async{
  //   var normalLocationPermission = await Permission.location.status;
  //   // var status1 = await Permission.locationWhenInUse.status;
  //   var backgroundLocationPermission = await Permission.locationAlways.status;
  //
  //   if(normalLocationPermission.isGranted && backgroundLocationPermission.isGranted){
  //     startTime();
  //   }
  //   else if (normalLocationPermission.isPermanentlyDenied){
  //     if(mounted) {
  //       showCustomDialog(
  //           context: context,
  //           cancelButtonPressed: () {
  //             // Navigator.pop(context);
  //             exit(0);
  //           },
  //           proceedButtonPressed: () async{
  //             Navigator.pop(context);
  //             await AppSettings.openAppSettings(type: AppSettingsType.location);
  //             setState(() {});
  //           },
  //           title: "Location Permission",
  //           cancelBtnText: "Deny",
  //           proceedBtnText: "Allow",
  //           description: "You need to allow location permission to use this app.");
  //     }
  //   }
  //   else if (backgroundLocationPermission.isPermanentlyDenied){
  //     if(mounted) {
  //       showCustomDialog(
  //           context: context,
  //           cancelButtonPressed: () {
  //             // Navigator.pop(context);
  //             exit(0);
  //           },
  //           proceedButtonPressed: () async{
  //             Navigator.pop(context);
  //             AppSettings.openAppSettings(type: AppSettingsType.location);
  //             setState(() {});
  //           },
  //           title: "Background Location",
  //           cancelBtnText: "Deny",
  //           proceedBtnText: "Allow",
  //           description: "You need to allow background location permission to use this app. This will facilitate the app to run in the background and track your location.");
  //     }
  //   }
  //   else if (normalLocationPermission.isDenied){
  //     if(mounted) {
  //       showCustomDialog(
  //           context: context,
  //           cancelButtonPressed: () {
  //             // Navigator.pop(context);
  //             exit(0);
  //           },
  //           proceedButtonPressed: () async{
  //             Navigator.pop(context);
  //             await Permission.location.request();
  //             setState(() {});
  //           },
  //           title: "Location Permission",
  //           cancelBtnText: "Deny",
  //           proceedBtnText: "Allow",
  //           description: "You need to allow location permission to use this app.");
  //     }
  //   }
  //   else if (backgroundLocationPermission.isDenied){
  //     if(mounted) {
  //       showCustomDialog(
  //           context: context,
  //           cancelButtonPressed: () {
  //             // Navigator.pop(context);
  //             exit(0);
  //           },
  //           proceedButtonPressed: () async{
  //             Navigator.pop(context);
  //             await Permission.locationAlways.request();
  //             setState(() {});
  //           },
  //           title: "Background Location",
  //           cancelBtnText: "Deny",
  //           proceedBtnText: "Allow",
  //           description: "You need to allow background location permission to use this app. This will facilitate the app to run in the background and track your location.");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
var theme = Theme.of(context);
// confirmPermission(context: context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Stack(
        children: <Widget>[
          // const Background(),
          Positioned(
            top: 0,
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.white24,
                        //         shape: BoxShape.rectangle,
                        //         borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                        //         gradient: LinearGradient(
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight,
                        //           colors: [
                        //             theme.colorScheme.primary.withOpacity(0.2),
                        //             theme.colorScheme.primary.withOpacity(1),
                        //           ],
                        //         ),
                        //       ),
                        //       child: const Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                        //         child: SplashImage(),
                        //       )),
                        // ),
                        const SplashImage(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(text: 'Pesa',
                              style: const TextStyle(fontFamily: 'Montserrat', letterSpacing: 2.0 ,fontSize: 50.0, color: Colors.black, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(text: 'Kit', style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 2.0 ,fontSize: 50.0, color: Colors.red.shade600, fontWeight: FontWeight.bold),)
                              ])),
                        ),
                        // const Spacer(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        //   child: RichText(text: TextSpan(text: '@PesaKit ',
                        //       style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 2.0 ,fontSize: 16.0, color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                        //       children: [
                        //         TextSpan(text: '${DateTime.now().year}',
                        //           style: TextStyle(fontFamily: 'Montserrat', letterSpacing: 2.0 ,fontSize: 16.0, color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                        //         )
                        //       ])),
                        // ),
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


// import 'package:flutter/material.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:siry/general_app_util/color/colors.dart';
//
//
// void dialogWithAnimation({required BuildContext context, required String title, required String description}){
//   showAnimatedDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//
//       return AlertDialog(
//         title: Center(child: Text(title, style: const TextStyle(fontFamily: 'Dm Sans', fontSize: 20.0, color: colorPrimaryDark),)),
//         content: Text( description,  style: const TextStyle(fontFamily: 'Dm Sans', fontSize: 16.0, color: colorPrimaryDark),),
//       );
//     },
//     animationType: DialogTransitionType.slideFromTop,
//     curve: Curves.fastOutSlowIn,
//     duration: const Duration(seconds: 1),
//   );
// }
//
// void comingSoonDialogWithAnimation({required BuildContext context, required String title}){
//   showAnimatedDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//
//       return AlertDialog(
//         title: Center(child: Text(title, style: const TextStyle(fontFamily: 'Dm Sans', fontSize: 20.0, color: colorPrimaryDark, fontWeight: FontWeight.bold),)),
//         content: const Text("coming_soon_text",  style: TextStyle(fontFamily: 'Dm Sans', fontSize: 16.0, color: colorPrimaryDark),),
//       );
//     },
//     animationType: DialogTransitionType.slideFromBottom,
//     curve: Curves.fastOutSlowIn,
//     duration: const Duration(seconds: 1),
//   );
// }
//
// void submissionFailureDialogWithAnimation({required BuildContext context, required String description}){
//   showAnimatedDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return
//         SimpleDialog(
//           title: const Center(child: Text("submission_failed_text", style: TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold),)),
//             contentPadding: const EdgeInsets.all(8.0),
//             children: [
//               const Divider(),
//              const SizedBox(height: 5.0,),
//              Image.asset("assets/images/error.png", height: 60.0,),
//               const SizedBox(height: 5.0,),
//               const Divider(),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
//                   child: Text(
//                     'Reason',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                 ),
//               ),
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//         padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0, bottom: 10.0),
//         child: Text(
//         description,
//         textAlign: TextAlign.center,
//         style: const TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontSize: 15.0),
//         ),
//         ),
//       ),
//             ]
//         );
//
//     },
//     animationType: DialogTransitionType.slideFromBottom,
//     curve: Curves.fastOutSlowIn,
//     duration: const Duration(seconds: 1),
//   );
// }
//
// void submissionFailureDialogWithAnimationWithTitle({required BuildContext context, required String description, required String title}){
//   showAnimatedDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return
//         SimpleDialog(
//             title: Center(child: Text(title, style: const TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold),)),
//             contentPadding: const EdgeInsets.all(8.0),
//             children: [
//               const Divider(),
//               const SizedBox(height: 5.0,),
//               Image.asset("assets/images/error.png", height: 60.0,),
//               const SizedBox(height: 5.0,),
//               const Divider(),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
//                   child: Text(
//                     'Reason',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0, bottom: 10.0),
//                   child: Text(
//                     description,
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontSize: 15.0),
//                   ),
//                 ),
//               ),
//             ]
//         );
//
//     },
//     animationType: DialogTransitionType.slideFromBottom,
//     curve: Curves.fastOutSlowIn,
//     duration: const Duration(seconds: 1),
//   );
// }
//
// void submissionSuccessDialogWithAnimationWithTitle({required BuildContext context, required String description, required String title,
// VoidCallback? onDialogPressed}){
//   showAnimatedDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return
//         SimpleDialog(
//             title: Center(child: Text(title, style: const TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold),)),
//             contentPadding: const EdgeInsets.all(8.0),
//             children: [
//               const Divider(),
//               const SizedBox(height: 5.0,),
//               Image.asset("assets/images/normal_avatar_logo.png", height: 60.0,),
//               const SizedBox(height: 5.0,),
//               const Divider(),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
//                   child: Text(
//                     'Information',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0, bottom: 10.0),
//                   child: Text(
//                     description,
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(color: colorPrimaryDark, fontFamily: 'Dm Sans', fontSize: 15.0),
//                   ),
//                 ),
//               ),
//               onDialogPressed != null ? const Divider(color: Colors.white,) : const SizedBox.shrink(),
//               onDialogPressed != null ? GestureDetector(
//                 onTap: onDialogPressed,
//                 child: Center(
//                   child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       color: colorPrimaryDark,
//                       child: const SizedBox(
//                         width: 250.0,
//                         child: Padding(
//                           padding:
//                           EdgeInsets.symmetric(vertical: 10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Continue',
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontFamily: 'Dm Sans',
//                                     color: colorWhite),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )),
//                 ),
//               ) : const SizedBox.shrink()
//             ]
//         );
//
//     },
//     animationType: DialogTransitionType.slideFromBottom,
//     curve: Curves.fastOutSlowIn,
//     duration: const Duration(seconds: 1),
//   );
// }

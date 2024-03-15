// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PhotoAddIcon extends StatefulWidget {
//   final Function(File?) onCapturedImage;
//   const PhotoAddIcon({Key? key, required this.onCapturedImage}) : super(key: key);
//
//   @override
//   State<PhotoAddIcon> createState() => _PhotoAddIconState();
// }
//
// class _PhotoAddIconState extends State<PhotoAddIcon> {
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () async{
//         File? imagePhoto =
//             await photoDialog(context: context);
//
//         widget.onCapturedImage(imagePhoto);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//                 color: theme.colorScheme.primary, shape: BoxShape.circle),
//             child:  const Padding(
//               padding: EdgeInsets.all(4.0),
//               child: Center(
//                   child: Icon(
//                     Icons.add_a_photo_outlined,
//                     color: Colors.white,
//                     size: 20.0,
//                   )),
//             )),
//       ),
//     );
//   }
// }
//
// // gallery or camera image dialog
// Future<File?> photoDialog({required BuildContext context}) async {
//   var theme = Theme.of(context);
//   final picker = ImagePicker();
//   return showDialog<File?>(
//       context: context,
//       builder: (innerContext) => AlertDialog(
//         title: Text(
//           'Choose',
//           style: TextStyle(
//               fontFamily: 'Montserrat', color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
//         ),
//         content: SizedBox(
//           height: 150,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Divider(),
//               TextButton(
//                   onPressed: () async {
//                     File? cameraFile =
//                     await getImageFromCamera(picker);
//                     if (cameraFile != null && context.mounted) {
//                       Navigator.pop(context, cameraFile);
//                     }
//                   },
//                   child: Text(
//                     'Take Photo',
//                     style: TextStyle(fontFamily: 'Montserrat', color: theme.colorScheme.primary),
//                   )),
//               const Divider(),
//               TextButton(
//                   onPressed: () async {
//                     File? galleryFile =
//                     await getImageFromGallery(picker);
//                     if (galleryFile != null && context.mounted) {
//                       Navigator.pop(context, galleryFile);
//                     }
//                   },
//                   child: Text('Select From Gallery',
//                       style: TextStyle(fontFamily: 'Montserrat', color: theme.colorScheme.primary))),
//               const Divider(),
//             ],
//           ),
//         ),
//       ),
//       barrierDismissible: true);
// }
//
// // capture image from gallery
// Future<File?> getImageFromGallery(ImagePicker picker) async {
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//
//     return imageFile;
//   } else {
//     return null;
//   }
// }
//
// // capture image from camera
// Future<File?> getImageFromCamera(ImagePicker picker) async {
//
//   final pickedFile = await picker.pickImage(
//       source: ImageSource.camera, maxHeight: 1800, maxWidth: 1800);
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//
//     return imageFile;
//   } else {
//     return null;
//   }
// }
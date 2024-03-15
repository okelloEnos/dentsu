// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
//
// Future<File> compressFile(File file) async {
//   final filePath = file.absolute.path;
//
//   bool isJpgOrJpeg = filePath.contains(RegExp(r'\.(jpe?g)$', caseSensitive: false));
//
//   if(!isJpgOrJpeg) {
//     return file;
//   }
//
//   final lastIndex = filePath.lastIndexOf(RegExp(r'\.(jpg|jpeg|png)'));
//   final splitted = filePath .substring(0, (lastIndex));
//   final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
//   var result = await FlutterImageCompress.compressAndGetFile(
//     file.absolute.path, outPath,
//     quality: 5,
//   );
//
//   print(file.lengthSync());
//
//   return await convertXFileToFile(XFile(result!.path));
// }
//
// Future<File> convertXFileToFile(XFile pickedFile) async {
//   final path = pickedFile.path;
//   return File(path);
// }
//
// Future<File> urlToPngFile(String imageUrl) async {
// // generate random number.
//   var rng = Random();
// // get temporary directory of device.
//   Directory tempDir = await getTemporaryDirectory();
// // get temporary path from temporary directory.
//   String tempPath = tempDir.path;
// // create a new file in temporary path with random file name.
//   File file = File('$tempPath${rng.nextInt(100)}.png');
// // call http.get method and pass imageUrl into it to get response.
//   Response response = await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));
// // write bodyBytes received in response to file.
//   await file.writeAsBytes(response.data);
// // now return the file which is created with random name in
// // temporary directory and image bytes from response is written to // that file.
//   return file;
// }
//
// Future<File> urlToPDFFile(String imageUrl) async {
// // generate random number.
//   var rng = Random();
// // get temporary directory of device.
//   Directory tempDir = await getTemporaryDirectory();
// // get temporary path from temporary directory.
//   String tempPath = tempDir.path;
// // create a new file in temporary path with random file name.
//   File file = File('$tempPath${rng.nextInt(100)}.pdf');
// // call http.get method and pass imageUrl into it to get response.
//   Response response = await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));
// // write bodyBytes received in response to file.
//   await file.writeAsBytes(response.data);
// // now return the file which is created with random name in
// // temporary directory and image bytes from response is written to // that file.
//   return file;
// }
//
//   Image imageFromBase64String(String base64String) {
//     return Image.memory(
//       base64Decode(base64String),
//       fit: BoxFit.fill,
//     );
//   }
//   Uint8List dataFromBase64String(String base64String) {
//     return base64Decode(base64String);
//   }
//    String base64String({required Uint8List data}) {
//     return base64Encode(data);
//   }
//
// Future<Uint8List> loadImageFromNetwork({required String imageUrl}) async {
//   var response = await Dio().get(imageUrl);
//   if (response.statusCode == 200) {
//     return response.data;
//   } else {
//     throw Exception('Failed to load image');
//   }
// }
//
// Future<Uint8List> loadImageFromFile({required File imageFile}) async {
//  return await imageFile.readAsBytes();
// }
//
// Future<List<Uint8List>> loadImageFromFileBatch({required List<File?> imageFiles}) async {
//   List<Uint8List> imageBytes = [];
//   for (File? imageFile in imageFiles) {
//     if (imageFile != null) {
//       imageBytes.add(await loadImageFromFile(imageFile: imageFile));
//     }
//
//   }
//   return imageBytes;
// }
//
// Future<Uint8List> loadImageFromAssets({required String assetPath}) async {
//   final ByteData data = await rootBundle.load(assetPath);
//   return data.buffer.asUint8List();
// }
//
// Future<File> saveImage({ required Uint8List data}) async {
//   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//   final directory = await getApplicationDocumentsDirectory();
//   File file = File('${directory.path}/$fileName');
//   await file.writeAsBytes(data);
//   return file;
// }

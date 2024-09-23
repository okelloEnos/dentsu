import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

Future<String?> getAndroidId() async {
  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id; // Unique device ID for Android
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor; // Unique device ID for iOS
  }
  return null;
}


// Create an instance of FlutterSecureStorage
const _storage = FlutterSecureStorage();

// UUID generator
const _uuid = Uuid();

// Key used to store the UUID in the Keychain
const _keyUuid = 'device_uuid';

// Function to get or generate the device UUID
Future<String?> getIosId() async {
  // Check if UUID already exists in Keychain
  String? uuid = await _storage.read(key: _keyUuid);

  if (uuid == null) {
    // If UUID does not exist, generate a new one
    uuid = _uuid.v4();

    // Store the new UUID in the Keychain
    await _storage.write(key: _keyUuid, value: uuid);
  }

  return uuid;
}

Future<String?> retrieveUnifiedId() async{
  if(!kIsWeb){
    if(Platform.isAndroid){
      return await getAndroidId();
    }
    else if(Platform.isIOS){
      return await getIosId();
    }
  }
  return null;
}

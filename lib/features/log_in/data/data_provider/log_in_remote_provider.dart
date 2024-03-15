import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../main.dart';
import '../../../../../util/constants/constants_barrel.dart';
import '../../../../../util/exception/custom_errors.dart';

class LogInRemoteDataProvider{

  LogInRemoteDataProvider({required Dio dio}): _dio = dio;

  final Dio _dio;

  Future<dynamic> remoteLogInRequest({required String phoneNumber, required String pin}) async{
   var logInUrl = "/auth/login";

   var logInData = {
     "phone": phoneNumber,
     "pin": pin
   };

    var logInResponse = await _dio.post(logInUrl, data: logInData);

   return customErrorHandling(logInResponse);

  }

  Future<dynamic> submittingDeviceTokenRequest() async {
    var url = "/profile/token";
    String token = sharedPreferences.getString(accessToken) ?? "";
    Options options = Options(headers: {"Authorization": "Bearer $token"});
    // final firebaseToken = await FirebaseMessaging.instance.getToken();
    const firebaseToken = "";
    String deviceToken = firebaseToken ?? "";
    var deviceTokenData = {
      "token": deviceToken
    };
    var deviceResponse = await _dio.post(url, data: deviceTokenData, options: options);

    return customErrorHandling(deviceResponse);
  }

  // update pin
  Future<dynamic> updatePinRequest({required String oldPin, required String newPin}) async{
    var updatePinUrl = "/profile/user/pin";

    String token = sharedPreferences.getString(accessToken) ?? "";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );

    var updatePinData = {
      "old_pin": oldPin,
      "new_pin": newPin
    };

    var updatePinResponse = await _dio.post(updatePinUrl, data: updatePinData, options: options);

    return customErrorHandling(updatePinResponse);
  }

  // log out
Future<dynamic> logOutRequest() async{
    const url = "/auth/logout";
    String token = sharedPreferences.getString(accessToken) ?? "";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"}
    );

    var response = await _dio.get(url, options: options);

    return customErrorHandling(response);
}
}
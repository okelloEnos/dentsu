import 'package:dio/dio.dart';

const String baseUrl = 'https://brtgw.britam.com/capiv2';

abstract class OtpRemoteDataSource {

  // request email for an otp
  Future<void> requestMailOtp({required String email});

  // validate email otp
  Future<void> validateMailOtp({required String email, required String code});
}

class OtpRemoteDataSourceImpl extends OtpRemoteDataSource {
  final Dio _dio;

  OtpRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> requestMailOtp({required String email}) async{
    var url = "${baseUrl}/auth/forgot-password";
    var emailMapData = {
      "email": email
    };
    final response = await _dio.post(url, data:  emailMapData);

    if((response.statusCode ?? 0) != 201){
      if((response.statusCode ?? 0) == 404) throw("User not found");
      throw("${response.statusMessage}");
    }
  }

  @override
  Future<void> validateMailOtp({required String email, required String code}) async{
    var url = "${baseUrl}/users/verify-otp-email";
    var data  = {
      "email" : email,
      "otp": code
    };

    final response = await _dio.post(url, data: data);

    if((response.statusCode ?? 0) != 201){
      throw("${response.statusMessage}");
    }
  }
}

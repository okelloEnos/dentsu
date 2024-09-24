

import 'otp_remote_data_source.dart';

class OtpRepositoryImpl extends OtpRepository{
  final OtpRemoteDataSource _otpRemoteDataSource;

  OtpRepositoryImpl({required OtpRemoteDataSource otpRemoteDataSource}) : _otpRemoteDataSource = otpRemoteDataSource ;

  @override
  Future<void> requestMailOtp({required String email}) {
   return _otpRemoteDataSource.requestMailOtp(email: email);
  }

  @override
  Future<void> validateMailOtp({required String email, required String code}) {
    return _otpRemoteDataSource.validateMailOtp(email: email, code: code);
  }


}

abstract class OtpRepository{

  // request email for an otp
  Future<void> requestMailOtp({required String email});

  // validate email otp
  Future<void> validateMailOtp({required String email, required String code});

}
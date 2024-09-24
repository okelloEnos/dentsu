

import 'otp_repository.dart';

class OtpUseCase{
  final OtpRepository _otpRepository;

  OtpUseCase({required OtpRepository otpRepository}) : _otpRepository = otpRepository;

  Future<void> executeRequestMailOtp ({required String email}){
    return _otpRepository.requestMailOtp(email: email);
  }

  Future<void> executeValidateMailOtp ({required String email, required String code}){
    return _otpRepository.validateMailOtp(email: email, code: code);
  }
}
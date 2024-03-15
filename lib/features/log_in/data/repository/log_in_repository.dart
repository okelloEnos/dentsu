import '../../../../../main.dart';
import '../../../../../util/constants/constants_barrel.dart';
import '../../login_barrel.dart';

class LogInRepository{

  LogInRepository({required LogInRemoteDataProvider logInRemoteDataProvider}): _logInRemoteDataProvider = logInRemoteDataProvider;

  final LogInRemoteDataProvider _logInRemoteDataProvider;

  // make a log in request
  Future<Profile> logIn({required String phoneNumber, required String pin}) async{
    var logInResponse = await _logInRemoteDataProvider.remoteLogInRequest(phoneNumber: phoneNumber, pin: pin);
    // ProfileData profileData = ProfileData.fromJson(logInResponse);
    Profile profile = Profile();
    await sharedPreferences.setString(accessToken, accessToken ?? "");
    await _logInRemoteDataProvider.submittingDeviceTokenRequest();
    return profile;
  }

  // update pin
  Future<void> updatePin({required String oldPin, required String newPin}) async{
    var pinUpdateResponse = await _logInRemoteDataProvider.updatePinRequest(oldPin: oldPin, newPin: newPin);

    return pinUpdateResponse;
  }

  // logout
Future<void> logOut() async{
    final response = await _logInRemoteDataProvider.logOutRequest();
    return response;
}
}
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../main.dart';
import '../../../../../util/constants/constants_barrel.dart';
import '../../login_barrel.dart';

class LogInRepository {
  LogInRepository({required LogInRemoteDataProvider logInRemoteDataProvider})
      : _logInRemoteDataProvider = logInRemoteDataProvider;

  final LogInRemoteDataProvider _logInRemoteDataProvider;

  // make a log in request
  Future<String> logIn(
      {required String email, required String password}) async {
    UserCredential logInResponse = await _logInRemoteDataProvider
        .accountLogInRequest(
        email: email, password: password);
    if (logInResponse.user != null) {
      return logInResponse.user!.uid;
    }
    else {
      throw("User not found");
    }
  }
  // logout
  Future<void> logOut() async {
    await _logInRemoteDataProvider.accountLogOutRequest();
  }
}

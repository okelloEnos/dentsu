import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../main.dart';
import '../../../../../util/constants/constants_barrel.dart';
import '../../../../../util/exception/custom_errors.dart';

class LogInRemoteDataProvider{

  LogInRemoteDataProvider({required Dio dio}): _dio = dio;

  final Dio _dio;

  Future<dynamic> accountLogInRequest({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw('Wrong password provided for that user.');
      }
      else if (e.code == 'invalid-credential') {
        throw('Invalid credentials provided, Confirm if you are registered and try using the correct credentials.');
      }
      else{
        throw(e.message ?? 'An error occurred');
      }
    }
    catch (e) {
      rethrow;
    }

  }

  // update pin
  Future<dynamic> accountCreationRequest({
    required String email,
    required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw('The account already exists for that email.');
      }
    }
    catch (e) {
      rethrow;
    }
  }

  // log out
Future<dynamic> accountLogOutRequest() async{
  await FirebaseAuth.instance.signOut();
}
}
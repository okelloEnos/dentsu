import 'package:firebase_database/firebase_database.dart';
class ProfileDataProvider{
final FirebaseDatabase _firebaseDatabase;

  ProfileDataProvider({required FirebaseDatabase firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase;
  Future<dynamic> fetchUserProfileRequest({required String userId}) async {
    try {
      final userInfoResponse = await _firebaseDatabase.ref("userProfiles").child(userId).get();
      if(userInfoResponse.exists){
        return userInfoResponse.value;
      }
      else{
        throw('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
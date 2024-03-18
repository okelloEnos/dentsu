import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/profile/data/data_provider/profile_data_provider.dart';

class ProfileRepository{
  final ProfileDataProvider _profileDataProvider;

  ProfileRepository({required ProfileDataProvider profileDataProvider})
      : _profileDataProvider = profileDataProvider;

  Future<Profile> fetchUserProfileRequest({required String userId}) async {
    final userInfoResponse = await _profileDataProvider.fetchUserProfileRequest(userId: userId);
    Profile profile = Profile.fromJson(userInfoResponse).copyWith(id: userId);

    return profile;
  }
}
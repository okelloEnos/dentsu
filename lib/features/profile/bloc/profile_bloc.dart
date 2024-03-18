import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/util/exception/exception_barrel.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc({required ProfileRepository profileRepository}) : _profileRepository = profileRepository, super(ProfileInitial()) {
    on<FetchProfileEvent>(_onFetchProfileEvent);
  }

  void _onFetchProfileEvent(FetchProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());
      final Profile profile = await _profileRepository.fetchUserProfileRequest(userId: event.userId);
      emit(ProfileSuccess(profile: profile));
    } on DioException catch (e) {
      emit(ProfileFailure(errorMessage: DioExceptions.fromDioError(e).toString()));
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }
}

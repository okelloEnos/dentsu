part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final Profile profile;

  const ProfileSuccess({required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

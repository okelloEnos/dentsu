part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class FetchProfileEvent extends ProfileEvent {
  final String userId;

  const FetchProfileEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}

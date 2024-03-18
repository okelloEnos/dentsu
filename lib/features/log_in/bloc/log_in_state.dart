part of 'log_in_bloc.dart';

abstract class LogInState extends Equatable {
  const LogInState();
}

class LogInInitial extends LogInState {
  @override
  List<Object> get props => [];
}

class LogInLoading extends LogInState {
  @override
  List<Object> get props => [];
}

class LogInSuccess extends LogInState {
  final String userId;

  const LogInSuccess({required this.userId});

  @override
  List<Object> get props => [userId];
}

class LogInFailure extends LogInState {
  final String errorMessage;

  const LogInFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class UpdatePinSuccess extends LogInState {

  @override
  List<Object> get props => [];
}

class UpdatePinFailure extends LogInState {
  final String errorMessage;

  const UpdatePinFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class UpdatePinLoading extends LogInState {
  @override
  List<Object> get props => [];
}

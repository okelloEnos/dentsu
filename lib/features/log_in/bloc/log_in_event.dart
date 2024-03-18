part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class LogInPressedEvent extends LogInEvent {
  final String email;
  final String password;

  const LogInPressedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LogOutPressedEvent extends LogInEvent {
  const LogOutPressedEvent();

  @override
  List<Object> get props => [];
}

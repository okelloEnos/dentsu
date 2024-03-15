part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

class LogInPressedEvent extends LogInEvent {
  final String phoneNumber;
  final String pin;

  const LogInPressedEvent({required this.phoneNumber, required this.pin});

  @override
  List<Object> get props => [phoneNumber, pin];
}

class UpdatePinPressedEvent extends LogInEvent {
  final String oldPin;
  final String newPin;

  const UpdatePinPressedEvent({required this.oldPin, required this.newPin});

  @override
  List<Object> get props => [oldPin, newPin];
}

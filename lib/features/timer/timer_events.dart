import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}
class TimerStarted extends TimerEvent {

}
class TimerTicked extends TimerEvent {
  final int duration;
  const TimerTicked(this.duration);

  @override
  List<Object> get props => [duration];
}
class TimerStop extends TimerEvent {

}

class PhoneOtpRequestedEvent extends TimerEvent {
  final String phoneNumber;
  const PhoneOtpRequestedEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class PhoneOtpValidationEvent extends TimerEvent {
  final String phoneNumber;
  final String code;
  const PhoneOtpValidationEvent({required this.phoneNumber, required this.code});

  @override
  List<Object> get props => [phoneNumber, code];
}

class MailOtpRequestedEvent extends TimerEvent {
  final String email;
  const MailOtpRequestedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class MailOtpValidationEvent extends TimerEvent {
  final String email;
  final String code;
  const MailOtpValidationEvent({required this.email, required this.code});

  @override
  List<Object> get props => [email, code];
}

class ResendPhoneOtpEvent extends TimerEvent {
  final String phoneNumber;
  const ResendPhoneOtpEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class ResendMailOtpEvent extends TimerEvent {
  final String email;
  const ResendMailOtpEvent({required this.email});

  @override
  List<Object> get props => [email];
}
import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);
  @override

  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}

class TimerOnFailure extends TimerState {
  final String errorText;

  const TimerOnFailure({required this.errorText}) : super(0);

  @override
  List<Object> get props => [errorText];
}

class PhoneOtpValidationInProgress extends TimerState {
  const PhoneOtpValidationInProgress(super.duration);
}

class PhoneOtpValidationOnSuccess extends TimerState {
  const PhoneOtpValidationOnSuccess() : super(0);
}

class PhoneOtpValidationOnFailure extends TimerState {
  final String errorText;

  const PhoneOtpValidationOnFailure({required this.errorText}) : super(0);

  @override
  List<Object> get props => [errorText];
}

class MailOtpValidationInProgress extends TimerState {
  const MailOtpValidationInProgress(super.duration);
}

class MailOtpValidationOnSuccess extends TimerState {
  const MailOtpValidationOnSuccess() : super(0);
}

class MailOtpValidationOnFailure extends TimerState {
  final String errorText;

  const MailOtpValidationOnFailure({required this.errorText}) : super(0);

  @override
  List<Object> get props => [errorText];
}

class MailOtpInProgress extends TimerState {
  const MailOtpInProgress(super.duration);
}

class MailOtpOnSuccess extends TimerState {
  const MailOtpOnSuccess() : super(0);
}

class MailOtpOnFailure extends TimerState {
  final String errorText;

  const MailOtpOnFailure({required this.errorText}) : super(0);

  @override
  List<Object> get props => [errorText];
}


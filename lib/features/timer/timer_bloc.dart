import 'dart:async';
import 'package:dentsu_test/features/timer/timer_events.dart';
import 'package:dentsu_test/features/timer/timer_source.dart';
import 'package:dentsu_test/features/timer/timer_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/exception/dio_exceptions.dart';
import 'otp_use_case.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const _duration = kIsWeb ? 180 : 30;

  StreamSubscription<int>? _tickerSubscription;
  final OtpUseCase _otpUseCase;

  TimerBloc({required Ticker ticker, required OtpUseCase otpUseCase})
      : _ticker = ticker, _otpUseCase = otpUseCase, super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerStop>(_onTimerStop);
    on<MailOtpRequestedEvent>(_onMailOtpRequest);
    on<MailOtpValidationEvent>(_onMailOtpValidation);
    on<ResendMailOtpEvent>(_onMailOtpResendRequest);

  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerRunInProgress(_duration));
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => add(TimerTicked(duration)));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0
        ? TimerRunInProgress(event.duration)
        : const TimerRunComplete());
  }

  void _onTimerStop(TimerStop event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerRunComplete());
  }

  void _onMailOtpResendRequest(
      ResendMailOtpEvent event, Emitter<TimerState> emit) async {
    try {
      // britamListening(stopListening: true);
      add(TimerStarted());
      await _otpUseCase.executeRequestMailOtp(email: event.email);
      // britamListening();
      // add(TimerStop());
      // add(TimerStarted());
    }
    on DioException catch (e) {
      // britamListening();
      add(TimerStop());
      if(e.response?.statusCode == 404){
        emit(const TimerOnFailure(errorText: "User with that email does not exist"));
      } else {
        emit(TimerOnFailure(
            errorText: DioExceptions
                .fromDioError(e)
                .message ?? "Something went wrong"));
      } } catch (e) {
      // britamListening();
      add(TimerStop());
      emit(TimerOnFailure(errorText: e.toString()));
    }
  }

  void _onMailOtpRequest(
      MailOtpRequestedEvent event, Emitter<TimerState> emit) async {
    try {
      // britamListening(stopListening: true);
      emit(const MailOtpInProgress(0));
      await _otpUseCase.executeRequestMailOtp(email: event.email);
      emit(const MailOtpOnSuccess());
    }
    on DioException catch (e) {
      // britamListening();
      if(e.response?.statusCode == 404){
        emit(const MailOtpOnFailure(errorText: "We couldn't find an account associated with the provided email address."));
      } else {
        emit(MailOtpOnFailure(
            errorText: DioExceptions.fromDioError(e).message ?? "Something went wrong"));
      }

    } catch (e) {
      // britamListening();
      emit(MailOtpOnFailure(errorText: e.toString()));
    }
  }


  void _onMailOtpValidation(
      MailOtpValidationEvent event, Emitter<TimerState> emit) async {
    try {
      // britamListening(stopListening: true);
      emit(const MailOtpValidationInProgress(0));
      await _otpUseCase.executeValidateMailOtp(email: event.email, code: event.code);
      // britamListening();
      emit(const MailOtpValidationOnSuccess());
    }
    on DioException catch (e) {
      // britamListening();
      emit(MailOtpValidationOnFailure(
          errorText: DioExceptions.fromDioError(e).message ?? "Something went wrong"));
    } catch (e) {
      // britamListening();
      emit(MailOtpValidationOnFailure(errorText: e.toString()));
    }
  }
}
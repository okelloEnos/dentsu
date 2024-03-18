import 'dart:async';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../util/util_barrel.dart';
import '../login_barrel.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInRepository _logInRepository;

  LogInBloc({required LogInRepository logInRepository})
      : _logInRepository = logInRepository,
        super(LogInInitial()) {
    on<LogInPressedEvent>(_userLogIn);
    on<LogOutPressedEvent>(_userLogout);
  }

  // user log in
  void _userLogIn(LogInPressedEvent event, Emitter<LogInState> emit) async {
    try {
      emit(LogInLoading());
      final String userId = await _logInRepository.logIn(
          email: event.email, password: event.password);
      emit(LogInSuccess(userId: userId));
    } on DioException catch (e) {
      emit(
          LogInFailure(errorMessage: DioExceptions.fromDioError(e).toString()));
    } catch (e) {
      emit(LogInFailure(errorMessage: e.toString()));
    }
  }

  // user log out
  void _userLogout(LogOutPressedEvent event, Emitter<LogInState> emit) async{
    try{
      emit(UpdatePinLoading());
       await _logInRepository.logOut();
      emit(UpdatePinSuccess());
    } on DioException catch (e) {
      emit(
          UpdatePinFailure(errorMessage: DioExceptions.fromDioError(e).toString()));
    } catch (e) {
      emit(UpdatePinFailure(errorMessage: e.toString()));
    }
  }

  // void logOut() async{
  //   try{
  //     await _logInRepository.logOut();
  //   }
  //   on DioException catch(e){
  //     rethrow;
  //   }
  //   catch(e){
  //     rethrow;
  //   }
  // }
}

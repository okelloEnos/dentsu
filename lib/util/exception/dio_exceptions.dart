import 'package:dio/dio.dart';
import 'dart:io';
class DioExceptions implements Exception{
  String? message;

  DioExceptions.fromDioError(DioException dioError){
    switch(dioError.type){
      case DioExceptionType.cancel:
        message = "Your request was cancelled, kindly try again";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Your request timed out while connecting to the server, kindly try again";
        break;
      case DioExceptionType.connectionError:
        if(dioError.error is SocketException){
          message = "Your request was not successful, check on your internet connection";}
        else{
          message = dioError.error.toString();
        }
        break;
      case DioExceptionType.receiveTimeout:
        message = "Your request timed out while receiving data from the server, kindly try again";
        break;
      case DioExceptionType.sendTimeout:
        message = "Your request timed out while sending data to the server, kindly try again";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.badCertificate:
        message = "Your request was not successful due to bad certificate, kindly contact our support team";
        break;
      case DioExceptionType.unknown:
          message = "${dioError.message}";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error){
    switch(statusCode){
      case 400:
        return "Your request was not successful due to bad response, kindly try again and if the issue persist contact our support team";

      case 401:
        return "Wrong credentials, Confirm and try again";

      case 404:
        return "Request page not found, kindly contact our support team";

      case 413:
        return "File too large, kindly find a smaller file and try again or contact our support team";

      case 500:
        return "Server under maintenance, kindly try again later or contact our support team";

      default:
        return "Something went wrong, kindly try again and if the issue persist contact our support team";
    }
  }

  @override
  String toString() {
    return message ?? "";
  }
}
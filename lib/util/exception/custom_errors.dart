import 'package:dio/dio.dart';

import '../util_barrel.dart';

dynamic customErrorHandling(Response<dynamic> response) {
  int responseValue = response.data['response_code'];

  switch (responseValue) {
    case 1:
      return response.data;
    case 2:
      final Map<String, dynamic> errorsMap = response.data['errors'];
      final List<dynamic> firstErrorValue = errorsMap.values.first;
      final errorContent = firstErrorValue.first;
      throw ("$errorContent");
    case 3:
    case 4:
    case 5:
      throw (response.data['message']);
    case 6:
      throw ({"code": stringConverter(response.data['response_code']), "message": response.data['message']});
    default:
      throw ("Kindly try again, if the issue persist contact our support team");
  }
}

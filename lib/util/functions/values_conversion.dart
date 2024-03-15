import 'package:intl/intl.dart';
// two decimal place integer
String preserveLeadingZero(int value) {
  return NumberFormat("00").format(value);
}

// money format
String formatNumber(int number) {
  if (number >= 1000000000) {
    double result = number / 1000000000;
    return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}B';
  } else if (number >= 1000000) {
    double result = number / 1000000;
    return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
  } else if (number >= 1000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
  } else {
    return '$number';
  }
}

// thousand number format
String thousandNumberFormat(String? amountValue) {
  String amountString = "0";
  if (amountValue == null || amountValue == "" || amountValue == "N/A") {
    amountString = "0";
  }
  else {
    amountString = amountValue;
  }
  double? amount = double.tryParse(amountString);
  late String convertedAmount;
  var formatter = NumberFormat("###,###");
  convertedAmount = formatter.format(amount);
  return convertedAmount;
}

// phone number formatter
String phoneNumberFormatter({required String selectedPhone}){
  String phoneNumber = selectedPhone.replaceAll(" ", "").replaceAll("+", "").trim();
  if(phoneNumber.length == 12){
    return "0${phoneNumber.substring(3)}";
  }
  else{
    return phoneNumber;
  }
}

String capitalizeFirstLetter(String receivedText) => receivedText[0].toUpperCase() + receivedText.substring(1);

String stringConverter(dynamic value){
  return "$value";
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'function_barrel.dart';

// attaching asterisk for required
String requiredContent({required bool isMissing}){
  return isMissing  ? "*" : "";
}

// color for required
Color requiredContentColor({required bool isMissing}){
  return isMissing  ? Colors.red : Colors.white;
}

// color for required
Color requiredContentColorAlternate({required bool isMissing, required Color colorPrimaryDark}){
  return isMissing  ? Colors.red : colorPrimaryDark;
}

int countryReference(String country){

  switch(country.toLowerCase()){
    case "uganda":
      return 3;
    case "tanzania":
      return 2;
    case "ghana":
      return 1;
    case "ethiopia":
      return 4;
    case "kenya":
    default:
      return 0;
  }
}

String timeConverterForEthiopia(String time){
  time = capitalizeFirstLetter(time.toLowerCase());
  String convertedTime = "";
 DateTime dateTime = DateFormat("MMM dd, yyyy").parse(time);
  convertedTime = DateTimeUtils.getFullDateDashedFormat(dateTime);
  return convertedTime;
}

bool checkForNull({required dynamic value}){
  if (value == null || value == "" || value == "null") {
    return true;
  }
  else{
    return false;
  }
}


import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getMonth(DateTime dateTime) {
    var formatter = DateFormat('MMM');
    return formatter.format(dateTime.toLocal());
  }

  static String getDayOfMonth(DateTime dateTime) {
    var formatter = DateFormat('dd');
    return formatter.format(dateTime.toLocal());
  }

  static String getFullDate(DateTime dateTime) {
    var formatter = DateFormat('EEEE dd MMM, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  static String getFullDateDashedFormat(DateTime dateTime) {
    var formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime.toLocal());
  }

  static DateTime getFullDateDashedFormatInDate(String dateTimeInString) {
    var formatter = DateFormat('dd-MM-yyyy');
    DateTime dateTime = formatter.parse(dateTimeInString);
    return dateTime.toLocal();
  }

  static String getFullDateDashedFormatReversed(DateTime dateTime) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime.toLocal());
  }

  static String getFullDateDashedWithTimeFormat(DateTime dateTime) {
    var formatter = DateFormat('dd-MM-yyyy, h:mm a');
    return formatter.format(dateTime.toLocal());
  }

  static String getFullDateTime(DateTime dateTime) {
    var formatter = DateFormat('EEEE dd MMM, yyyy h:mm a');
    return formatter.format(dateTime.toLocal());
  }


  static String getHalfDateTime(DateTime dateTime) {
    var formatter = DateFormat('dd MMM, yyyy h:mm a');
    return formatter.format(dateTime.toLocal());
  }
  static String getTime(DateTime dateTime) {
    var formatter = DateFormat('h:mm a');
    return formatter.format(dateTime.toLocal());
  }

  static String gethour(DateTime dateTime) {
    var formatter = DateFormat('HH');
    return formatter.format(dateTime.toLocal());
  }

  static String getDayMonth(DateTime dateTime) {
    var formatter = DateFormat('dd MMM');
    return formatter.format(dateTime.toLocal());
  }

  static String getDayMonthYear(DateTime dateTime) {
    var formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  static String getDayOfWeek(DateTime dateTime) {
    var formatter = DateFormat('EEEE');
    return formatter.format(dateTime);
  }

  static String getDayWeek(DateTime dateTime) {
    var formatter = DateFormat('dd');
    return formatter.format(dateTime);
  }

  static String getTicketDate(DateTime dateTime) {
    var formatter = DateFormat(' dd MMM, yyyy');
    return formatter.format(dateTime);
  }
}

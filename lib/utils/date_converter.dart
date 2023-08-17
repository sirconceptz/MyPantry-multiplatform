import 'package:intl/intl.dart';

class DateConverter {
  static String convertFromDbToShow(String date) {
    DateTime tempDate = DateFormat("yyyy.MM.dd").parse(date);
    return DateFormat.yMEd().format(tempDate);
  }
}
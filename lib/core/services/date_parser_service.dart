import 'package:intl/intl.dart';

class DateParserService {
  ///this method is responsible for only getting formatted date from datetime
  ///datatype
  static String getDateOnly(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}

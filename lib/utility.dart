import 'package:intl/intl.dart';
import 'package:untitled/constant.dart';

class Utility {
  timeFormatToDisplay(DateTime dateTime) {
    bool isToday = dateTime.day == DateTime.now().day;
    return DateFormat(isToday ? timeFormat : dateDMMMFormat).format(dateTime);
  }
}

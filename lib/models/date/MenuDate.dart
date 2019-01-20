import 'package:spartan_foods/util/DateUtil.dart';

class MenuDate {
  DateTime _time;

  MenuDate([DateTime time]) {
    _time = time ?? DateTime.now();
  }

  DateTime get time => _time;

  String get weekday => DateUtil.getWeekday(time);

  bool get isToday {
    DateTime now = DateTime.now();

    return time.day == now.day && time.month == now.month &&
      time.year == now.year;
  }

  void forward() {
    _time = _time.add(Duration(days: 1));
  }

  void back() {
    _time = _time.subtract(Duration(days: 1));
  }

  void now() {
    _time = DateTime.now();
  }
}
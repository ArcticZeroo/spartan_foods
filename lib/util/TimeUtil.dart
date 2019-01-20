import 'package:flutter/material.dart';

abstract class TimeUtil {
  static TimeOfDay timeFromHour(double time) {
    double minutesAsDecimal = time - time.truncate();

    int minutes = (minutesAsDecimal * 60).floor();
    int hour = time.floor();

    return new TimeOfDay(
      minute: minutes,
      hour: hour
    );
  }
}
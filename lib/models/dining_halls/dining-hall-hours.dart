import 'package:flutter/material.dart';
import 'package:spartan_foods/enum/dining_halls/meal.dart';
import 'package:spartan_foods/util/TimeUtil.dart';

class DiningHallHours {
  final bool closed;
  final double begin;
  final double end;
  final Meal meal;

  TimeOfDay get beginTime => TimeUtil.timeFromHour(begin);
  TimeOfDay get endTime => TimeUtil.timeFromHour(end);

  DiningHallHours({
    @required this.closed,
    @required this.begin,
    @required this.end,
    @required this.meal
  });
}
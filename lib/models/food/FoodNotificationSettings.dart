import 'package:spartan_foods/enum/notification/TimeUnit.dart';

class FoodNotificationSettings {
  final bool isEnabled;
  final TimeUnit timeUnit;
  final int timeAmount;

  FoodNotificationSettings({
    this.isEnabled = false,
    this.timeUnit = TimeUnit.day,
    this.timeAmount = 0
  });
}
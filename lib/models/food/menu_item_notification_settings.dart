import 'package:spartan_foods/enum/notification/TimeUnit.dart';

class MenuItemNotificationSettings {
  final bool isEnabled;
  final TimeUnit timeUnit;
  final int timeAmount;

  MenuItemNotificationSettings({
    this.isEnabled = false,
    this.timeUnit = TimeUnit.day,
    this.timeAmount = 0
  });
}
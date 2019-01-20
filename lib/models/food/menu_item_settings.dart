import 'package:meta/meta.dart';
import 'package:spartan_foods/models/food/menu_item_notification_settings.dart';

class MenuItemSettings {
  final bool isFavorite;
  final MenuItemNotificationSettings notificationSettings;

  MenuItemSettings({
    this.isFavorite = false,
    this.notificationSettings = null
  });
}
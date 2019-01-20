import 'package:meta/meta.dart';

import 'package:spartan_foods/models/food/FoodNotificationSettings.dart';

class FoodItemSettings {
  static final RegExp nameRegex = new RegExp(r'^(.+?)(?:\s+\(.+\))?$');
  static final RegExp cleanNamePattern = new RegExp(r'[^\w]');

  final bool isFavorite;
  final FoodNotificationSettings notificationSettings;

  FoodItemSettings({
    @required this.isFavorite,
    @required this.notificationSettings
  });

  static String getFavoriteName(String name) {
    if (!nameRegex.hasMatch(name)) {
      return null;
    }

    var match = nameRegex.firstMatch(name);

    if (match.groupCount < 1) {
      return null;
    }

    var matchedName = match.group(1);

    // Name With Spaces -> namewithspaces
    // Spencer's Name -> spencersname
    return matchedName.toLowerCase().replaceAll(cleanNamePattern, '');
  }
}
import 'package:spartan_foods/constants/Tables.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/provider/repository.dart';
import 'package:spartan_foods/util/FoodUtil.dart';

class FavoriteFoodProvider {
  static final RegExp nameRegex = new RegExp(r'^(.+?)(?:\s+\(.+\))?$');
  static final RegExp cleanNamePattern = new RegExp(r'[^\w]');
  static final instance = new FavoriteFoodProvider._internal();

  Map<String, String> favoriteFoodsCleanedToDisplayName = {};

  FavoriteFoodProvider._internal();

  static String getCleanedName(String name) {
    return FoodUtil.getCleanedName(name);
  }

  Future<List<String>> retrieveFavoriteFoods() async {
    if (favoriteFoodsCleanedToDisplayName.isNotEmpty) {
      return favoriteFoodsCleanedToDisplayName.keys.toList();
    }

    var database = await Repository.instance.getHandle();

    var result = await database.rawQuery('SELECT * FROM ${Tables.favoriteFoods}');

    List<String> favorites = [];

    for (var row in result) {
      if (!row.containsKey('cleanedName') || !row.containsKey('displayName')) {
        continue;
      }

      var foodName = row['cleanedName'];
      var displayName = row['displayName'];

      favorites.add(foodName);
      favoriteFoodsCleanedToDisplayName[foodName] = displayName;
    }

    return favorites;
  }

  Future<bool> isFavorite(MenuItem item) async {
    await retrieveFavoriteFoods();

    var cleanedName = getCleanedName(item.name);

    return favoriteFoodsCleanedToDisplayName.containsKey(cleanedName);
  }

  Future setFavorite(MenuItem item, bool shouldBeFavorite) async {
    var cleanedName = getCleanedName(item.name);
    var database = await Repository.instance.getHandle();

    if (!shouldBeFavorite) {
      favoriteFoodsCleanedToDisplayName.remove(cleanedName);
      await database.delete(Tables.favoriteFoods, where: 'cleanedName = ?', whereArgs: [cleanedName]);
    } else {
      favoriteFoodsCleanedToDisplayName[cleanedName] = item.name;
      await database.insert(Tables.favoriteFoods, { 'cleanedName': cleanedName, 'displayName': item.name });
    }
  }
}
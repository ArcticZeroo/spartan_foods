import 'package:spartan_foods/constants/Tables.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/provider/repository.dart';

class FavoriteFoodProvider {
  static final RegExp nameRegex = new RegExp(r'^(.+?)(?:\s+\(.+\))?$');
  static final RegExp cleanNamePattern = new RegExp(r'[^\w]');
  static final instance = new FavoriteFoodProvider._internal();

  Map<String, bool> favoriteFoods = {};

  FavoriteFoodProvider._internal() {}

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

  Future<List<String>> retrieveFavoriteFoods() async {
    if (favoriteFoods.isNotEmpty) {
      return favoriteFoods.keys.toList();
    }

    var database = await Repository.instance.getHandle();

    var result = await database.rawQuery('SELECT * FROM ${Tables.favoriteFoods}');

    List<String> favorites = [];

    for (var row in result) {
      if (!row.containsKey('foodName')) {
        continue;
      }

      var foodName = row['foodName'];

      favorites.add(foodName);
      favoriteFoods[foodName] = true;
    }

    return favorites;
  }

  Future<bool> isFavorite(MenuItem item) async {
    await retrieveFavoriteFoods();

    var name = getFavoriteName(item.name);

    if (!favoriteFoods.containsKey(name)) {
      return false;
    }

    return favoriteFoods[name];
  }

  Future setFavorite(MenuItem item, bool shouldBeFavorite) async {
    var name = getFavoriteName(item.name);
    var database = await Repository.instance.getHandle();

    if (!shouldBeFavorite) {
      favoriteFoods.remove(name);
      await database.delete(Tables.favoriteFoods, where: 'foodName = ?', whereArgs: [name]);
    } else {
      favoriteFoods[name] = true;
      await database.insert(Tables.favoriteFoods, { 'foodName': name });
    }
  }
}
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:spartan_foods/models/dining_halls/dining_hall.dart';
import 'package:spartan_foods/models/food/meal.dart';
import 'package:spartan_foods/provider/dining_hall_provider.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String name;
  final String venue;
  final int time;
  final bool isVegetarian;
  final bool isVegan;
  final bool isGlutenFree;
  final List<String> preferences;
  final List<String> allergens;
  final String formattedDate;
  @JsonKey(name: 'diningHall')
  final String hall;
  @JsonKey(name: 'meal')
  final int mealOrdinal;

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(time);
  DiningHall get diningHall => DiningHallProvider.instance.searchNameToDiningHall[hall];
  Meal get meal => Meal.all[mealOrdinal];

  MenuItem({
    @required this.name,
    @required this.venue,
    @required this.hall,
    @required this.isVegetarian,
    @required this.isVegan,
    @required this.isGlutenFree,
    @required this.preferences,
    @required this.allergens,
    @required this.mealOrdinal,
    @required this.formattedDate,
    @required this.time
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
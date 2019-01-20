import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:spartan_foods/models/dining_halls/dining-hall.dart';
import 'package:spartan_foods/models/date/MenuDate.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  final String name;
  final String venue;
  final String diningHall;
  final bool isVegetarian;
  final bool isVegan;
  final bool isGlutenFree;
  final List<String> preferences;
  final List<String> allergens;
  final int meal;
  final String formattedDate;

  MenuItem({
    @required this.name,
    @required this.venue,
    @required this.diningHall,
    @required this.isVegetarian,
    @required this.isVegan,
    @required this.isGlutenFree,
    @required this.preferences,
    @required this.allergens,
    @required this.meal,
    @required this.formattedDate
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
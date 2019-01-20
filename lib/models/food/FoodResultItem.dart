import 'package:meta/meta.dart';
import 'package:spartan_foods/models/dining_halls/dining-hall.dart';
import 'package:spartan_foods/models/date/MenuDate.dart';

class FoodResultItem {
  final String name;
  final String venue;
  final DiningHall diningHall;
  final MenuDate date;

  FoodResultItem({
    @required this.name,
    @required this.venue,
    @required this.diningHall,
    @required this.date
  });
}
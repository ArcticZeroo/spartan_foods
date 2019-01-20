import 'package:spartan_foods/models/dining_halls/dining-hall.dart';

class DiningHallProvider {
  static DiningHallProvider instance = DiningHallProvider._internal();

  DiningHallProvider._internal() {}

  Future<List<DiningHall>> retrieveDiningHalls() async {
    return null;
  }
}
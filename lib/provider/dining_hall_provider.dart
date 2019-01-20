import 'package:spartan_foods/constants/Pages.dart';
import 'package:spartan_foods/models/dining_halls/dining_hall.dart';
import 'package:spartan_foods/request/rest_client.dart';

class DiningHallProvider {
  static DiningHallProvider instance = DiningHallProvider._internal();
  RestClient _restClient = new RestClient(Pages.frozorBase);
  List<DiningHall> diningHalls;
  Map<String, DiningHall> searchNameToDiningHall = {};

  DiningHallProvider._internal();

  Future<List<DiningHall>> retrieveDiningHalls() async {
    if (diningHalls == null) {
      List<dynamic> response = await _restClient.get(Pages.diningHallList);

      diningHalls = response.map((json) {
        var diningHall = DiningHall.fromJson(json as Map<String, dynamic>);

        searchNameToDiningHall[diningHall.searchName] = diningHall;

        return diningHall;
      }).toList();
    }

    return diningHalls;
  }
}

import 'package:spartan_foods/constants/Pages.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/models/query/menu_query_builder.dart';
import 'package:spartan_foods/request/rest_client.dart';

class MenuQueryClient {
  static RestClient _restClient = new RestClient(Pages.frozorBase + Pages.menuSearch);

  static Future<List<MenuItem>> search(MenuQueryBuilder queryBuilder) async {
    List<dynamic> results = await _restClient.get(queryBuilder.build());

    return results.map((result) => MenuItem.fromJson(result as Map<String, dynamic>)).toList();
  }
}
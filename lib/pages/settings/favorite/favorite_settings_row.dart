import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/menu_query_builder.dart';
import 'package:spartan_foods/pages/result/result_page.dart';
import 'package:spartan_foods/request/menu_query_client.dart';

class FavoriteSettingsRow extends StatelessWidget {
  final String cleanedName;
  final String displayName;

  FavoriteSettingsRow({@required this.cleanedName, @required this.displayName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          MenuQueryClient.search(
                  new MenuQueryBuilder().nameCleaned(cleanedName))
              .then((data) {
            var navigator = Navigator.of(context);
            navigator.pop();
            navigator
                .push(MaterialPageRoute(builder: (ctx) => ResultPage(data)));
          });
        },
        title: Text(displayName),
        trailing: Icon(Icons.search));
  }
}

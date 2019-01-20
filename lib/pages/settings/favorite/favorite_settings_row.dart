import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/menu_query_builder.dart';
import 'package:spartan_foods/pages/result/result_page.dart';
import 'package:spartan_foods/request/menu_query_client.dart';

class FavoriteSettingsRow extends StatelessWidget {
  final String nameCleaned;

  FavoriteSettingsRow(this.nameCleaned);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          MenuQueryClient.search(
            new MenuQueryBuilder().nameCleaned(nameCleaned))
            .then((data) {
            var navigator = Navigator.of(context);
            navigator.pop();
            navigator
              .push(MaterialPageRoute(builder: (ctx) => ResultPage(data)));
          });
        },
      title: Text(nameCleaned),
      trailing: Icon(Icons.search)
    );
  }
}

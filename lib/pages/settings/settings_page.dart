import 'package:flutter/material.dart';
import 'package:spartan_foods/pages/settings/favorite/favorite_settings_row.dart';
import 'package:spartan_foods/provider/favorite_food_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Container(height: 12),
      ListTile(
        leading: Icon(Icons.restaurant),
        title: Text('Your favorite food'),
        subtitle: Text(
            'Add food to your favorites for quick searching and notifications for its next appearance!'),
      )
    ];

    for (var key in FavoriteFoodProvider.instance.favoriteFoods.keys) {
      bodyWidgets.add(FavoriteSettingsRow(key));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(children: bodyWidgets),
    );
  }
}

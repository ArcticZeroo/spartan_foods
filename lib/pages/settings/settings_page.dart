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
      ),
      Divider(height: 4.0)
    ];

    if (FavoriteFoodProvider.instance.favoriteFoodsCleanedToDisplayName.isEmpty) {
      bodyWidgets.add(Container(
        child: Text('You don\'t have any favorite foods added! Go search some to add them.', textAlign: TextAlign.center),
        padding: EdgeInsets.all(12.0)
      ));
    } else {
      for (var entry in FavoriteFoodProvider.instance.favoriteFoodsCleanedToDisplayName.entries) {
        bodyWidgets.add(FavoriteSettingsRow(
          cleanedName: entry.key,
          displayName: entry.value
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(children: bodyWidgets),
    );
  }
}

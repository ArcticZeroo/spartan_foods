import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item_settings.dart';
import 'package:spartan_foods/models/food/menu_item.dart';

class FoodListItem extends StatelessWidget {
  final MenuItem item;
  final MenuItemSettings settings;

  FoodListItem(this.item, this.settings);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(item.name),
              Divider(height: 4.0),
              Text(item.venue),
              Text(item.diningHall),
              Text(item.meal.toString())
            ],
          )
        ],
    );
  }
}
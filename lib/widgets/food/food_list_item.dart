import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/meal.dart';
import 'package:spartan_foods/models/food/menu_item_settings.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/provider/dining_hall_provider.dart';
import 'package:spartan_foods/util/DateUtil.dart';
import 'package:spartan_foods/widgets/food/food_data_row.dart';
import 'package:spartan_foods/widgets/food/food_preference_indicators.dart';

class FoodListItem extends StatelessWidget {
  final MenuItem item;
  final MenuItemSettings settings;

  FoodListItem(this.item, this.settings);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Container(height: 4.0),
                FoodDataRow(
                  iconData: Icons.location_on,
                  child: Text('${item.diningHall.hallName} at venue "${item.venue}"'),
                ),
                FoodDataRow(
                  iconData: Icons.access_time,
                  child: Text('${DateUtil.formatDateFully(item.date)}')
                ),
                FoodDataRow(
                  iconData: Icons.restaurant,
                  child: Text('${item.meal.name}')
                ),
                FoodPreferenceIndicators(item)
              ],
            ),
          )
        ],
      ),
    );
  }
}
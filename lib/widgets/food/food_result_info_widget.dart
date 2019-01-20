import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/food_item_settings.dart';
import 'package:spartan_foods/models/food/food_result_item.dart';
import 'package:spartan_foods/widgets/food/food_favorite_indicator_widget.dart';

class FoodResultInfoWidget extends StatelessWidget {
  final FoodResultItem item;
  final FoodItemSettings settings;

  FoodResultInfoWidget({
    @required this.item,
    @required this.settings
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FoodFavoriteIndicatorWidget(settings.isFavorite),
        Column(
          children: <Widget>[
            Text(item.name),
            Text(item.venue),
            // TODO: Add real dining hall support
            Text(item.diningHall)
          ],
        )
      ]
    );
  }
}
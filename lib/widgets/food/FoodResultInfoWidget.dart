import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/FoodItemSettings.dart';
import 'package:spartan_foods/models/food/FoodResultItem.dart';
import 'package:spartan_foods/widgets/food/FoodFavoriteIndicatorWidget.dart';

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
            Text(item.diningHall.fullName)
          ],
        )
      ]
    );
  }
}
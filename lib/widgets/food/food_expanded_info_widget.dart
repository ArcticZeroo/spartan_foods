import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spartan_foods/models/food/food_item_settings.dart';

typedef void ToggleChange(bool value);

class FoodExpandedInfoWidget extends StatelessWidget {
  final FoodItemSettings settings;
  final ToggleChange onFavoriteToggle;

  FoodExpandedInfoWidget(
      {@required this.settings, @required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }
}

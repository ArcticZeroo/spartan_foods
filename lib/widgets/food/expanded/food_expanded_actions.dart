import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/widgets/food/expanded/favorite_widget.dart';
import 'package:spartan_foods/widgets/food/expanded/google_search.dart';

class FoodExpandedActions extends StatelessWidget {
  final MenuItem item;

  FoodExpandedActions(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FavoriteWidget(item),
        GoogleSearchWidget(item)
      ],
    );
  }
}
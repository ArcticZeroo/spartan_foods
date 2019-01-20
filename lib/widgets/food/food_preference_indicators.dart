import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/widgets/container/rounded_indicator.dart';

class FoodPreferenceIndicators extends StatelessWidget {
  final MenuItem item;

  const FoodPreferenceIndicators(this.item);

  Widget buildPreferenceIndicator(String name) {
    return Container(
      margin: EdgeInsets.all(4),
      child: RoundedIndicator(
        child: Text(name, style: TextStyle(fontSize: 12, color: Colors.white)),
        paddingSize: 8
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    if (item.isGlutenFree) {
      widgets.add(buildPreferenceIndicator('Gluten Free'));
    }

    if (item.isVegan) {
      widgets.add(buildPreferenceIndicator('Vegan'));
    }

    if (item.isVegetarian) {
      widgets.add(buildPreferenceIndicator('Vegetarian'));
    }

    return Row(
      children: widgets
    );
  }
}
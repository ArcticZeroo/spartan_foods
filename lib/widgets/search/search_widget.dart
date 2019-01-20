import 'package:flutter/material.dart';
import 'package:spartan_foods/constants/MenuQuery.dart';
import 'package:spartan_foods/models/food/meal.dart';
import 'package:spartan_foods/models/query/menu_query_builder.dart';
import 'package:spartan_foods/models/query/query_filter.dart';
import 'package:spartan_foods/widgets/container/rounded_indicator.dart';

class SearchWidget extends StatelessWidget {
  static final Map<String, QueryFilter> filters = {
    '${MenuQuery.foodName}': StringQueryFilter('Food Name'),
    '${MenuQuery.prefGlutenFree}': BooleanQueryFilter('Gluten Free'),
    '${MenuQuery.prefVegetarian}': BooleanQueryFilter('Vegetarian'),
    '${MenuQuery.prefVegan}': BooleanQueryFilter('Vegan'),
    '${MenuQuery.mealBreakfast}': BooleanQueryFilter('Breakfast'),
    '${MenuQuery.mealLunch}': BooleanQueryFilter('Lunch'),
    '${MenuQuery.mealDinner}': BooleanQueryFilter('Dinner'),
    '${MenuQuery.mealLateNight}': BooleanQueryFilter('Late Night'),
  };

  Widget get verticalSpacer =>
      Padding(padding: EdgeInsets.symmetric(vertical: 12.0));

  MenuQueryBuilder aggregateFilters() {
    var builder = new MenuQueryBuilder();

    String foodName = filters[MenuQuery.foodName].current.value;
    if (foodName != null && foodName.isNotEmpty) {
      builder.substring(foodName);
    }

    bool isGlutenFree = filters[MenuQuery.prefGlutenFree].current.value;
    if (isGlutenFree != null && isGlutenFree) {
      builder.boolean('isGlutenFree', isGlutenFree);
    }

    bool isVegetarian = filters[MenuQuery.prefVegetarian].current.value;
    if (isVegetarian != null && isVegetarian) {
      builder.boolean('isVegetarian', isVegetarian);
    }

    bool isVegan = filters[MenuQuery.prefVegan].current.value;
    if (isVegan != null && isVegan) {
      builder.boolean('isVegan', isVegan);
    }

    List<int> meals = [];

    var isBreakfast = filters[MenuQuery.mealBreakfast].current.value;
    if (isBreakfast != null && isBreakfast) {
      meals.add(Meal.breakfast.ordinal);
    }

    var isLunch = filters[MenuQuery.mealLunch].current.value;
    if (isLunch != null && isLunch) {
      meals.add(Meal.lunch.ordinal);
    }
    
    var isDinner = filters[MenuQuery.mealDinner].current.value;
    if (isDinner != null && isDinner) {
      meals.add(Meal.dinner.ordinal);
    }
    
    var isLateNight = filters[MenuQuery.mealLateNight].current.value;
    if (isLateNight != null && isLateNight) {
      meals.add(Meal.lateNight.ordinal);
    }

    if (meals.isNotEmpty) {
      builder.meals(meals);
    }

    return builder;
  }

  void onSubmitPress() {
    print(aggregateFilters().build());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: <Widget>[
        filters[MenuQuery.foodName],
        verticalSpacer,
        RoundedIndicator(
          text: 'Eating Preferences',
          backgroundColor: Colors.green[700],
        ),
        filters[MenuQuery.prefGlutenFree],
        filters[MenuQuery.prefVegetarian],
        filters[MenuQuery.prefVegan],
        verticalSpacer,
        RoundedIndicator(
          text: 'Meal',
          backgroundColor: Colors.green[700],
        ),
        filters[MenuQuery.mealBreakfast],
        filters[MenuQuery.mealLunch],
        filters[MenuQuery.mealDinner],
        filters[MenuQuery.mealLateNight],
        RaisedButton(
            onPressed: this.onSubmitPress,
            child: Text('Search'),
            color: Colors.green[200])
      ]),
    );
  }
}

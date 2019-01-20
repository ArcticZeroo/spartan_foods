import 'package:flutter/material.dart';
import 'package:spartan_foods/pages/home/query_page.dart';
import 'package:spartan_foods/provider/dining_hall_provider.dart';
import 'package:spartan_foods/provider/favorite_food_provider.dart';

void main() {
  var loadFavoriteFood = FavoriteFoodProvider.instance.retrieveFavoriteFoods();
  var loadDiningHalls = DiningHallProvider.instance.retrieveDiningHalls();

  Future.wait([
    loadFavoriteFood,
    loadDiningHalls
  ]).whenComplete(() {
    runApp(SpartanFoodsApp());
  });
}

class SpartanFoodsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  => MaterialApp(
      color: Colors.green,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent
      ),
      title: 'Spartan Foods',
      home: QueryPage()
    );
}
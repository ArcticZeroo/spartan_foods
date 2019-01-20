import 'package:flutter/material.dart';
import 'package:spartan_foods/pages/home/query_page.dart';
import 'package:spartan_foods/provider/favorite_food_provider.dart';

void main() {
  var loadFavoriteFood = FavoriteFoodProvider.instance.retrieveFavoriteFoods();

  Future.wait([
    loadFavoriteFood
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
      routes: {
        '/': (ctx) => QueryPage()
      },
    );
}
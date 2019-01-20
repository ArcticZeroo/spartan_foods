import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/models/food/menu_item_settings.dart';
import 'package:spartan_foods/widgets/food/food_expandable.dart';
import 'package:spartan_foods/widgets/food/food_list_item.dart';

class ResultPage extends StatelessWidget {
  final List<MenuItem> results;

  Widget get verticalSeparator {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12)
    );
  }

  ResultPage(this.results);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Query: ${results.length} Search Result${results.length == 1 ? '' : 's'}'),
          centerTitle: true
        ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (ctx, index) => FoodExpandable(results[index]),
      ),
    );
  }
}
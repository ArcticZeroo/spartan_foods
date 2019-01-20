import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/food_result_item.dart';
import 'package:spartan_foods/widgets/food/food_result_info_widget.dart';

class ResultsListWidget extends StatelessWidget {
  final List<FoodResultItem> results;

  const ResultsListWidget({Key key, @required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return FoodResultInfoWidget(results[index]);
      },
    );
  }
}

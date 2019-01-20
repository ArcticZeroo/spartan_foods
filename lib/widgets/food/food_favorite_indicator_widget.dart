import 'package:flutter/material.dart';

class FoodFavoriteIndicatorWidget extends StatelessWidget {
  static final double indicatorWidth = 8.0;
  final bool isFavorite;

  FoodFavoriteIndicatorWidget(this.isFavorite);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isFavorite ? Colors.yellow : null
      ),
      width: indicatorWidth
    );
  }
}
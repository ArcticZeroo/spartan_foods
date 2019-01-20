import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/provider/favorite_food_provider.dart';

class FavoriteWidget extends StatefulWidget {
  final MenuItem item;

  FavoriteWidget(this.item);

  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();

}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorite;

  @override
  void initState() {
    super.initState();

    var foodKey = FavoriteFoodProvider.getFavoriteName(widget.item.name);
    isFavorite = FavoriteFoodProvider.instance.favoriteFoods[foodKey] ?? false;
  }

  onFavoriteToggle() {
    setState(() {
      isFavorite = !isFavorite;
      FavoriteFoodProvider.instance.setFavorite(widget.item, isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isFavorite
          ? Icons.star
          : Icons.star_border,
        color: isFavorite
          ? Colors.amber
          : null
      ),
      title: Text('Toggle this item as a favorite'),
      subtitle: Text('Tap to toggle whether this item is one of your favorite foods!'),
      onTap: onFavoriteToggle,
    );
  }
}
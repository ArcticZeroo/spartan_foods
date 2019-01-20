import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/util/UrlUtil.dart';

class GoogleSearchWidget extends StatelessWidget {
  final MenuItem item;

  GoogleSearchWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: Text('Look this food up on Google'),
      onTap: () {
        UrlUtil.openGoogleSearch('${item.name} food');
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:spartan_foods/models/food/menu_item.dart';
import 'package:spartan_foods/models/food/menu_item_settings.dart';
import 'package:spartan_foods/widgets/expandable/expandable_custom.dart';
import 'package:spartan_foods/widgets/expandable/value_notifier_toggle_icon.dart';
import 'package:spartan_foods/widgets/food/food_list_item.dart';

class FoodExpandable extends StatefulWidget {
  final MenuItem item;

  FoodExpandable(this.item);

  @override
  State<StatefulWidget> createState() => _FoodExpandableState();
}

class _FoodExpandableState extends State<FoodExpandable> {
  ExpandableCustom _expandableCustom;

  @override
  void initState() {
    super.initState();

    _expandableCustom = ExpandableCustom(
      title: Builder(builder: buildTitle),
      body: Text('Yeah this is here I guess')
    );
  }

  Widget buildTitle(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FoodListItem(widget.item, MenuItemSettings()),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: ValueNotifierToggleIcon(_expandableCustom.isCollapsed),
            onPressed: () {
              _expandableCustom.isCollapsed.value = !_expandableCustom.isCollapsed.value;
            },
          ),
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return _expandableCustom;
  }
}
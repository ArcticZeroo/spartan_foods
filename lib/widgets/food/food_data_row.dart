import 'package:flutter/material.dart';

class FoodDataRow extends StatelessWidget {
  final Widget child;
  final IconData iconData;

  const FoodDataRow({Key key, @required this.child, @required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: Colors.grey[500]),
        Container(width: 4.0),
        child
      ]
    );
  }
}
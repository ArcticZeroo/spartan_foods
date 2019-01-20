import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/QueryFilter.dart';

abstract class IQueryFilterWidget extends StatelessWidget {
  final QueryFilter filter;

  IQueryFilterWidget(this.filter);

  Widget buildLabel() {
    return Text(this.filter.name);
  }

  Widget buildInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.buildLabel(),
        this.buildInput()
      ],
    );
  }
}
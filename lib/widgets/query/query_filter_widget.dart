import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/query_filter.dart';
import 'package:spartan_foods/widgets/container/rounded_indicator.dart';

abstract class IQueryFilterWidget<T> extends StatelessWidget {
  final QueryFilter<T> filter;
  final ValueNotifier<T> current;

  T get defaultValue {
    return filter.defaultValue;
  }

  IQueryFilterWidget(this.filter, this.current);

  Widget buildLabel() {
    return RoundedIndicator(
      text: filter.name,
      backgroundColor: Colors.green[700],
    );
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
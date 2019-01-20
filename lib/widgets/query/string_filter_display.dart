import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/query_filter.dart';
import 'package:spartan_foods/widgets/query/query_filter_widget.dart';

class StringFilterDisplay extends IQueryFilterWidget<String> {
  StringFilterDisplay(QueryFilter<String> filter, ValueNotifier<String> current) : super(filter, current);

  @override
  Widget buildInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: filter.name
        ),
        onChanged: (String value) {
          this.current.value = value;
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spartan_foods/enum/query/QueryFilterDisplay.dart';
import 'package:spartan_foods/models/dropdown/dropdown_option.dart';
import 'package:spartan_foods/models/food/meal.dart';
import 'package:spartan_foods/models/serializable/ISerializable.dart';
import 'package:spartan_foods/widgets/query/boolean_filter_display.dart';
import 'package:spartan_foods/widgets/query/string_filter_display.dart';

abstract class QueryFilter<T> extends StatelessWidget implements ISerializable<T> {
  final String name;
  final QueryFilterDisplay display;
  final T defaultValue;
  final ValueNotifier<T> current;

  QueryFilter({
    @required this.name,
    @required this.display,
    this.defaultValue
  }): current = ValueNotifier<T>(defaultValue);

  Widget build(BuildContext context);
}

class StringQueryFilter extends QueryFilter<String> {
  StringQueryFilter(String name): super(
    name: name,
    display: QueryFilterDisplay.string
  ) {
    print('Creating new filter');
  }

  @override
  String serialize(String value) => value;

  @override
  String deserialize(String value) => value;

  @override
  Widget build(ctx) => StringFilterDisplay(this, current);
}

class BooleanQueryFilter extends QueryFilter<bool> {
  BooleanQueryFilter(String name): super(
    name: name,
    display: QueryFilterDisplay.toggle
  );

  @override
  bool deserialize(String value) => value?.toLowerCase() == 'true';

  @override
  String serialize(bool value)  => value ? 'true' : 'false';

  @override
  Widget build(ctx) => BooleanFilterDisplay(this, current);
}
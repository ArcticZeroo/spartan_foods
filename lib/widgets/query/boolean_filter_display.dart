import 'package:flutter/material.dart';
import 'package:spartan_foods/models/query/query_filter.dart';
import 'package:spartan_foods/widgets/managed/managed_checkbox.dart';
import 'package:spartan_foods/widgets/managed/managed_checkbox_with_text.dart';
import 'package:spartan_foods/widgets/query/query_filter_widget.dart';

class BooleanFilterDisplay extends IQueryFilterWidget<bool> {
  BooleanFilterDisplay(QueryFilter<bool> filter, ValueNotifier<bool> current) : super(filter, current);

  @override
  Widget buildLabel() {
    return null;
  }

  @override
  Widget buildInput() {
    return null;
  }

  @override
  Widget build(BuildContext context) => ManagedCheckboxWithText(
    text: filter.name,
    onChange: (bool value) {
      this.current.value = value;
    }
  );
}
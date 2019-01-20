import 'package:flutter/material.dart';

typedef void OnChange(bool value);

class ManagedCheckbox extends StatefulWidget {
  final OnChange onChange;
  final bool initialValue;

  ManagedCheckbox({
    @required this.onChange,
    this.initialValue = false
  });

  @override
  State<StatefulWidget> createState() => new _ManagedCheckboxState();
}

class _ManagedCheckboxState extends State<ManagedCheckbox> {
  bool isChecked;

  @override
  void initState() {
    super.initState();

    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => Checkbox(
    value: isChecked,
    onChanged: (bool value) {
       setState(() {
         isChecked = value;
         widget.onChange(value);
       });
    }
  );
}
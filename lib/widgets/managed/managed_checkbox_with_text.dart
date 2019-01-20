import 'package:flutter/material.dart';

typedef void OnChange(bool value);

class ManagedCheckboxWithText extends StatefulWidget {
  final OnChange onChange;
  final bool initialValue;
  final String text;

  ManagedCheckboxWithText({
    @required this.onChange,
    @required this.text,
    this.initialValue = false
  });

  @override
  State<StatefulWidget> createState() => new _ManagedCheckboxWithTextState();
}

class _ManagedCheckboxWithTextState extends State<ManagedCheckboxWithText> {
  bool isChecked;

  @override
  void initState() {
    super.initState();

    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => InkWell(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16.0
            )
          ),
        ),
        Checkbox(
          value: isChecked,
          onChanged: (bool value) {
            setState(() {
              isChecked = value;
              widget.onChange(value);
            });
          }
        )
      ],
    ),
    onTap: () {
      setState(() {
        this.isChecked = !this.isChecked;
        widget.onChange(this.isChecked);
      });
    },
  );
}
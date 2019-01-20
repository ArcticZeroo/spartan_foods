import 'package:flutter/material.dart';

class ValueNotifierToggleIcon extends StatefulWidget {
  final ValueNotifier<bool> valueNotifier;

  ValueNotifierToggleIcon(this.valueNotifier);

  @override
  State<StatefulWidget> createState() => _ValueNotifierToggleIconState();
}

class _ValueNotifierToggleIconState extends State<ValueNotifierToggleIcon> {
  bool value;

  @override
  void initState() {
    super.initState();

    widget.valueNotifier.addListener(onValueNotifierChange);
  }

  @override
  void deactivate() {
    super.deactivate();

    widget.valueNotifier.removeListener(onValueNotifierChange);
  }

  void onValueNotifierChange() {
    setState(() {
      value = widget.valueNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Icon((value ?? widget.valueNotifier.value) ? Icons.add : Icons.remove);
  }
}
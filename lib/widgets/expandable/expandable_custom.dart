import 'package:flutter/material.dart';
import 'package:spartan_foods/widgets/expandable/animation/expansion_animator.dart';

class ExpandableCustom extends StatefulWidget {
  final Widget title;
  final Widget body;
  final ValueNotifier<bool> isCollapsed;
  final ValueNotifier<bool> isEnabled;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  ExpandableCustom({
    Key key,
    this.title,
    this.body,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    ValueNotifier collapseController,
    bool isEnabled = true,
    bool isCollapsedByDefault = false
  }) :
      this.isCollapsed = collapseController ?? new ValueNotifier(isCollapsedByDefault),
      this.isEnabled = new ValueNotifier(isEnabled),
      super(key: key);

  void setEnabled(bool value) {
    this.isEnabled.value = value;
  }

  @override
  _ExpandableCustomState createState() => new _ExpandableCustomState();
}

class _ExpandableCustomState extends State<ExpandableCustom> {
  ExpansionAnimator _expansionAnimator;

  @override
  void initState() {
    super.initState();

    _expansionAnimator = new ExpansionAnimator(
      child: widget.body,
      initial: widget.isCollapsed.value,
      collapseController: widget.isCollapsed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
      children: <Widget>[
        new InkWell(
          child: widget.title,
          onTap: () {
            if (!widget.isEnabled.value) {
              return;
            }

            setState(() {
              widget.isCollapsed.value = !widget.isCollapsed.value;
            });
          },
        ),
        _expansionAnimator
      ],
    );
  }
}
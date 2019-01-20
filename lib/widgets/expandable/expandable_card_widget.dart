import 'package:flutter/material.dart';
import 'package:spartan_foods/widgets/card/material_card.dart';

class ExpandableCardWidget extends StatefulWidget {
  final Widget title;
  final Widget body;
  final Color backgroundColor;
  final Color arrowColor;
  final ValueNotifier<bool> isCollapsed;

  ExpandableCardWidget({
    Key key,
    @required
    this.title,
    @required
    this.body,
    this.backgroundColor,
    this.arrowColor,
    bool initial = false
  }) :
      this.isCollapsed = ValueNotifier(initial),
      super(key: key);

  @override
  _ExpandableCardWidgetState createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  _ExpandableCardWidgetState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
    );
  }

  @override
  void initState() {
    super.initState();

    if (!widget.isCollapsed.value) {
      showChildren();
    }
  }

  void showChildren() {
    if (_animationController.value == 0) {
      _animationController.forward();
    }
  }

  void hideChildren() {
    if (_animationController.value != 0) {
      _animationController.reverse();
    }
  }

  void updateChildrenVisibility() {
    if (widget.isCollapsed.value) {
      hideChildren();
    } else {
      showChildren();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialCard(
      backgroundColor: widget.backgroundColor,
      title: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            widget.title,
            IconButton(
              icon: Icon(
                widget.isCollapsed.value ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                color: widget.arrowColor
              ),
              onPressed: null,
              tooltip: widget.isCollapsed.value ? 'Expand' : 'Collapse'
            )
          ],
        ),
        onTap: () {
          setState(() {
            widget.isCollapsed.value = !widget.isCollapsed.value;
            updateChildrenVisibility();
          });
        },
      ),
      body: SizeTransition(
        sizeFactor: _animationController,
        child: widget.body,
      ),
    );
  }
}
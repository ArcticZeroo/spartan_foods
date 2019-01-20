import 'package:flutter/material.dart';
import 'package:spartan_foods/enum/scroll/ScrollLocation.dart';
import 'package:spartan_foods/widgets/scroll/double_scroll_controller.dart';

class DoubleScrollingListWidget extends StatelessWidget {
  final Widget primaryWidget;
  final Widget secondaryWidget;
  final ValueNotifier<ScrollLocation> _scrollLocation = ValueNotifier(ScrollLocation.start);
  final ValueNotifier<bool> _isScrollEnabled = ValueNotifier(false);
  // final DoubleScrollController _scrollController = DoubleScrollController();

  const DoubleScrollingListWidget({Key key, this.primaryWidget, this.secondaryWidget}) : super(key: key);

  void setScrollEnabled(bool value) {
    this._isScrollEnabled.value =  value;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      controller: _scrollController,
      ,
    );
  }}
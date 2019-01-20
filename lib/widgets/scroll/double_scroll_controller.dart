import 'package:flutter/material.dart';

class DoubleScrollController extends ScrollController {
  static final moveDuration = Duration(milliseconds: 500);
  static final moveCurve = ElasticInOutCurve(moveDuration.inMilliseconds / Duration.millisecondsPerSecond);

  void _move(double location) {
    this.animateTo(location, duration: moveDuration, curve: moveCurve);
  }

  void forward() {
    _move(this.position.maxScrollExtent);
  }

  void back() {
    _move(this.position.minScrollExtent);
  }
}
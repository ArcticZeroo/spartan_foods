import 'package:flutter/material.dart';

class RoundedIndicator extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double paddingSize;

  RoundedIndicator({
    this.backgroundColor,
    this.textColor,
    this.paddingSize = 12.0,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingSize, horizontal: paddingSize * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingSize * 2),
        color: backgroundColor ?? Theme.of(context).primaryColor
      ),
      child: Text(text, style: TextStyle(color: textColor ?? Colors.white))
    );
  }
}
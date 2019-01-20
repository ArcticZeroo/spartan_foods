import 'package:flutter/material.dart';

typedef Future<T> OnFutureButtonClick<T>();
typedef void OnFutureComplete<T>(T data);

class FutureButton<T> extends StatefulWidget {
  final Widget child;
  final OnFutureButtonClick<T> getFutureOnClick;

  FutureButton(
      {@required this.child,
      @required this.getFutureOnClick});

  @override
  State<StatefulWidget> createState() => _FutureButtonState();
}

class _FutureButtonState extends State<FutureButton> {
  Future future;

  void onButtonPress() {
    setState(() {
      future = widget.getFutureOnClick();
    });
  }

  Widget buildButton([bool disabled = false]) {
    return RaisedButton(
      color: Colors.blue,
      child: widget.child,
      onPressed: disabled ? null : onButtonPress,
    );
  }

  Widget buildSnapshot(ctx, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.done) {
      return buildButton();
    }

    return Column(
      children: <Widget>[
        buildButton(true),
        Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: future,
        builder: buildSnapshot
  );
}

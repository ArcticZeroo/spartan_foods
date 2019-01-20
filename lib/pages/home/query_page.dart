import 'package:flutter/material.dart';
import 'package:spartan_foods/widgets/search/search_widget.dart';

class QueryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text(
            'Spartan Foods Search',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          pinned: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.settings, color: Colors.black))
          ],
          elevation: 0.0,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(height: 24.0),
            SearchWidget()
          ]),
        )
      ]),
    );
  }
}

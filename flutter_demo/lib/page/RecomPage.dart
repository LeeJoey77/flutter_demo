import 'package:flutter/material.dart';

class RecommandPage extends StatelessWidget {
  final String title;
  RecommandPage({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Container(
        color: Colors.white
      )
    );
  }
}
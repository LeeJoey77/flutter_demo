import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {
  final String title;
  FindPage({this.title, Key key}) : super(key: key);

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
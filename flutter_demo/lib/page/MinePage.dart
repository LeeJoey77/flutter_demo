import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  final String title;
  MinePage({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        color: Colors.white
      )
    );
  }
}
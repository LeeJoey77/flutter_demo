import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String title;
  AboutPage({this.title, Key key}) : super(key: key);

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
import 'package:flutter/material.dart';

class ChangePSPage extends StatelessWidget {
  final String title;
  ChangePSPage({this.title, Key key}) : super(key: key);

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
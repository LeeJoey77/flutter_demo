import 'package:flutter/material.dart';

class FDInputWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  FDInputWidget({Key key, this.hintText, this.onChanged}): super(key: key);

  @override
  _FDInputWidgetState createState() => _FDInputWidgetState();
}

class _FDInputWidgetState extends State<FDInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: Icon(Icons.account_box),
      ),
    );
  }
}
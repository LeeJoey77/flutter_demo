import 'package:flutter/material.dart';

class CommonUtil {

  // 带确定按钮的 alert
  static Future<T> showAlertDialog<T>(
    BuildContext context, {
    String title,
    String content,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: content != null ? Text(content) : null,
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

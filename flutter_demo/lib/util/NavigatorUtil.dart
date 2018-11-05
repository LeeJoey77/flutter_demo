import 'package:flutter/material.dart';
import 'package:flutter_demo/page/qrcodepage.dart';
import 'package:flutter_demo/page/logIn.dart';
import 'package:flutter_demo/page/findpage.dart';
import 'package:flutter_demo/page/RecomPage.dart';
import 'package:flutter_demo/page/MinePage.dart';
import 'package:flutter_demo/page/ChangePSPage.dart';
import 'package:flutter_demo/page/AboutPage.dart';

class NavigatorUtil {
  
  static gotoScanQrPage(BuildContext context) {
     Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return ScanQrPage();
      }));
  }

  static gotoLogInPage(BuildContext context) {
    Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return LogInPage();
      }));
  }
}
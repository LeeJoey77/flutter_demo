import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:flutter_demo/widget/FDInputWidget.dart';
import 'package:flutter_demo/util/CommonUti.dart';
import 'package:flutter_demo/network/HttpUtil.dart';
import 'package:flutter_demo/network/url.dart';

class LogInPage extends StatefulWidget {

  LogInPage({ Key key }) : super(key: key);
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final leftPad = 25.0;
  final rightPad = 25.0;
  final avatar_width = 120.0;
  //用做存储的属性, 不能放在 build 方法里
  var _userName = '';
  var _passWord = '';
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  // final FocusNode userFocusNode = FocusNode();
  // final FocusNode pwFocusNode = FocusNode();
  
  @override
  Widget build(BuildContext context) {
    final kScreenWidth = MediaQuery.of(context).size.width;


    final logo = CircleAvatar(
      radius: avatar_width / 2,
      child: ClipOval(
        child: Image.asset(
          'resource/music1.jpeg',
          width: avatar_width,
          height: avatar_width,
        ),
      ),
    );

    final appName = Text(
      'Flutter Demo',
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
    );

    final inputField = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FDInputWidget(
              controller: _userController,
              hintText: '请输入用户名',
              onChanged: (value) {
                _userName = value;
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            FDInputWidget(
              controller: _pwController,
              hintText: '请输入密码',
              onChanged: (value) { 
                _passWord = value;
              },
            ),
          ]),
    );

    final loginBt = Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: MaterialButton(
        child: Text('登   录'),
        color: Colors.blue,
        disabledColor: Colors.grey,
        textColor: Colors.white,
        minWidth: 240,
        height: 44,
        onPressed: () {
          if (_userName == '') {
            CommonUtil.showAlertDialog(context, title: '用户名不能为空');
          } else if (_pwController.text.length == 0) {
            CommonUtil.showAlertDialog(context, title: '密码不能为空');
          } else {
            //  HttpManager.dataRequest(Address.getLogOutUrl(), 'GET', null);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
          }
        },
      ),
    );

    return Container(
        color: Colors.white,
        padding:
            EdgeInsets.only(left: leftPad, right: rightPad, top: 0, bottom: 10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            logo,
            SizedBox(
              height: 15,
            ),
            appName,
            SizedBox(
              height: 85,
            ),
            inputField,
            SizedBox(
              height: 50,
            ),
            loginBt
          ],
        )
      );
    }
}

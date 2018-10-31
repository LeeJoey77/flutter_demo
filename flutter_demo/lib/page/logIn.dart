import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/FDInputWidget.dart';
import 'homepage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    // return _listViewLayout(context);
    return _pageLayout(context);
  }
}

Widget _pageLayout(BuildContext context) {
  var _userName = '';
  var _passWord = '';
  final kScreenWidth = MediaQuery.of(context).size.width;
  final leftPad = 25.0;
  final rightPad = 25.0;

  final logo = CircleAvatar(
    radius: 45.0,
    child: ClipOval(
        child: Image.asset(
      'resource/Swiss-flag.jpg',
      fit: BoxFit.cover,
      width: 90,
      height: 90,
    )),
  );
  final inputField = Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FDInputWidget(hintText: '请输入用户名', onChanged: (value){
            _userName = value;
          },),
          Padding(padding: EdgeInsets.all(10.0),),
          FDInputWidget(hintText: '请输入密码', onChanged: (value){
            _passWord = value;
          },),
        ]
    ),
  );
  final loginBt = MaterialButton(
    child: Text('登录'),
    color: Colors.blue,
    disabledColor: Colors.grey,
    textColor: Colors.white,
    minWidth: 150,
    height: 44,
    onPressed: () {
      if (_userName == '') {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return AlertDialog(
              title: Text('用户名不能为空'),
              actions: <Widget>[
                FlatButton(
                  child: Text('确定'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
         );
      } else if (_passWord == '') {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return AlertDialog(
              title: Text('密码不能为空'),
              actions: <Widget>[
                FlatButton(
                  child: Text('确定'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
         );
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        }));
      }
    },
  );
  return Padding(
    padding: EdgeInsets.only(left: leftPad, right: rightPad, top: 84, bottom: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        logo,
        SizedBox(height: 120,),
        inputField,
        SizedBox(height: 50,),
        loginBt,
      ],
    ),
 );
}

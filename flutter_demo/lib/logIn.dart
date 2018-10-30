import 'package:flutter/material.dart';
import 'homepage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    // return _listViewLayout(context);
    return _stackLayout(context);
  }
}

Widget _stackLayout(BuildContext context) {
  final kScreenWidth = MediaQuery.of(context).size.width;
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
  final emailAndPasswordTF = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(children: <Widget>[
          Icon(Icons.account_box),
          SizedBox(width: 7),
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: 1,
            height: 20,
          ),
          SizedBox(width: 7),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(hintText: '请输入用户名'),
            ),
          )
        ]),
        Row(children: <Widget>[
          Icon(Icons.pets),
          SizedBox(width: 7),
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: 1,
            height: 20,
          ),
          SizedBox(width: 7),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(hintText: '请输入密码'),
            ),
          )
        ]),
      ]);
  final loginBt = MaterialButton(
    child: Text('登录'),
    color: Colors.blue,
    disabledColor: Colors.grey,
    textColor: Colors.white,
    minWidth: 150,
    height: 44,
    onPressed: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      }));
    },
  );
  return Scaffold(
      body: Container(
    // padding: EdgeInsets.only(left: 25, right: 25.0),
    child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
      Positioned(
          left: 0,
          top: 50,
          child: Container(
            color: Colors.red,
            constraints: BoxConstraints(
              maxWidth: kScreenWidth,
            ),
            alignment: Alignment.center,
            child: logo,
          )),
      Positioned(
        left: 50,
        top: 300,
        child: Container(
          constraints: BoxConstraints(maxWidth: kScreenWidth - 2 * 50),
          alignment: Alignment.center,
          child: emailAndPasswordTF,
        ),
      ),
      Positioned(
        left: 0,
        bottom: 70,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: kScreenWidth,
          ),
          alignment: Alignment.center,
          child: loginBt,
        ),
      ),
    ]),
  )
      // body: Center(
      //   // child: Center(
      //     child: ListView(
      //       shrinkWrap: true,
      //       padding: EdgeInsets.only(left: 25, top: 0, right: 25.0),
      //       children: <Widget>[
      //         logo,

      //         SizedBox(height: 150.0),
      //         // emailAndPasswordTF,
      //         // SizedBox(height: 48.0),
      //         loginBt,
      //         SizedBox(height: 48.0),
      //       ],
      //    ),
      // //  )
      // )
      );
  // return Scaffold(
  //   body: Center(
  //     // child: Center(
  //       child: ListView(
  //         shrinkWrap: true,
  //         padding: EdgeInsets.only(left: 25, top: 0, right: 25.0),
  //         children: <Widget>[
  //           logo,

  //           SizedBox(height: 150.0),
  //           // emailAndPasswordTF,
  //           // SizedBox(height: 48.0),
  //           loginBt,
  //           SizedBox(height: 48.0),
  //         ],
  //      ),
  //   //  )
  //   )
  // );
}

// 使用 ListView 布局子视图
Widget _listViewLayout(BuildContext context) {
  final logo = new Hero(
    tag: 'hero',
    child: new CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 48.0,
      child: new Image.asset('resource/Swiss-flag.jpg'),
    ),
  );

  final email = new TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'suyie001@gmail.com',
    decoration: new InputDecoration(
        hintText: 'Email',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border:
            new OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final password = new TextFormField(
    autofocus: false,
    initialValue: 'some password',
    obscureText: true,
    decoration: new InputDecoration(
        hintText: 'Password',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border:
            new OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final loginButton = new Padding(
    padding: new EdgeInsets.symmetric(vertical: 16.0),
    child: new Material(
      borderRadius: BorderRadius.circular(32.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      elevation: 5.0,
      child: new MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return HomePage();
          }));
        },
        color: Colors.lightBlueAccent,
        child: new Text(
          'Log In',
          style: new TextStyle(color: Colors.white),
        ),
      ),
    ),
  );

  final forgetLabel = new FlatButton(
    onPressed: () {},
    child: new Text(
      'Forget Password?',
      style: new TextStyle(color: Colors.black54),
    ),
  );

  return new Scaffold(
    backgroundColor: Colors.white,
    body: new Center(
      child: new Center(
        child: new ListView(
          shrinkWrap: true,
          padding: new EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(
              height: 8.0,
            ),
            password,
            SizedBox(
              height: 24.0,
            ),
            loginButton,
            forgetLabel
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'qrcodepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/network/url.dart';
import 'package:flutter_demo/page/findpage.dart';
import 'package:flutter_demo/page/RecomPage.dart';
import 'package:flutter_demo/page/MinePage.dart';
import 'package:flutter_demo/page/ChangePSPage.dart';
import 'package:flutter_demo/page/AboutPage.dart';
import 'package:flutter_demo/util/NavigatorUtil.dart';
import 'package:flutter_demo/widget/HomeContentCell.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  void _tapTabbarItem(int index) {
    setState(() {
       _currentIndex = index;   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.face),
            tooltip: 'iconbutton',
            onPressed: () {
              print('onpressed');
            },
          )
        ],
      ),
      body: _createHomeBody(_currentIndex),
      drawer: _createDrawer(),
      bottomNavigationBar: _createBottomNavigationBars(_currentIndex, _tapTabbarItem),
      floatingActionButton: _floatButton(context),
      backgroundColor: Colors.white,
    );
  }
}

Widget _createDrawer() {
  return Drawer(
          child: Container(
                child: Column(children: <Widget>[
                  SizedBox(height: 30),
                  _userImage(),
                  _drawerListView(),
                ]),
              ),
  );
}

//
Widget _createBottomNavigationBars(int index,ValueChanged<int> onChanged) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: new Icon(Icons.fastfood),
        title: Text('首页'),
        backgroundColor: Colors.white,
        // activeIcon: new Icon(Icons.fastfood),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.flag),
        title: Text('发现'),
        // activeIcon: new Icon(Icons.fast_forward),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.question_answer),
        title: Text('推荐'),
        // activeIcon: new Icon(Icons.fast_forward),
        backgroundColor: Colors.blue,
      )
    ],
    onTap: onChanged,
    currentIndex: index,
    iconSize: 30,
    type: BottomNavigationBarType.fixed,
  );
}

Widget _floatButton(BuildContext context) {
  return FloatingActionButton(
    child: Text('Float'),
    onPressed: () { NavigatorUtil.gotoScanQrPage(context); },
  );
}

Widget _createHomeBody(int index) {
  if (index == 0) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (context, count) {
        return HomeContentCell();
      },
    );
  }else if (index == 1) {
    return Container(
      color: Colors.white,
    );
  }
  return Container(
    color: Colors.white,
  );
  
}

//Drawer userImage
Widget _userImage() {
  return Container(
          color: Colors.white,
          constraints: BoxConstraints(maxHeight: 90),
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 45.0,
            child: ClipOval(
                child: Image.asset(
              'resource/Swiss-flag.jpg',
              fit: BoxFit.cover,
              width: 90,
              height: 90,
            )),
          )
    );
}

//Drawer ListView
Widget _drawerListView() {
  const List<String> titleList = ['我的', '修改密码', '关于', '退出登录'];
  var pageList = [MinePage(title: titleList[0],), 
                  ChangePSPage(title: titleList[1]),
                  AboutPage(title: titleList[2])];
  return Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text('${titleList[index]}'),
                    onTap: () {
                      if (index < titleList.length - 1) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return pageList[index];
                          }
                        ));
                      } else {
                        NavigatorUtil.gotoLogInPage(context);
                      }
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return new Container(
                    color: Colors.grey,
                    height: 1,
                  );
                },
                itemCount: titleList.length,
              ),
            );
}
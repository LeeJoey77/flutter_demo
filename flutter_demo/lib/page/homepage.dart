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
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_demo/widget/ItemCell.dart';
import 'package:flutter_demo/widget/MusicCell.dart';
import 'package:flutter_demo/widget/TitleButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var _selectedItem = '';
  void _tapTabbarItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QQ Music'),
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: '',
                  child: ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text('听歌识曲'),
                  ),
                ),
                PopupMenuItem(
                  value: '',
                  child: ListTile(
                    leading: Icon(Icons.scanner),
                    title: Text('扫一扫'),
                  ),
                ),
                PopupMenuItem(
                  value: '',
                  child: ListTile(
                    leading: Icon(Icons.image),
                    title: Text('视频海报'),
                  ),
                ),
              ];
            },
            onSelected: (str) {
              setState(() {
                _selectedItem = str;
              });
            },
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ],
      ),
      body: _createHomeBody(_currentIndex, context),
      drawer: _createDrawer(),
      bottomNavigationBar:
          _createBottomNavigationBars(_currentIndex, _tapTabbarItem),
      floatingActionButton: _floatButton(context),
      backgroundColor: Colors.white,
    );
  }
}

Widget _createDrawer() {
  return Drawer(
    child: Container(
      child: Column(children: <Widget>[
        SizedBox(height: 60),
        _userImage(),
        _drawerListView(),
      ]),
    ),
  );
}

//
Widget _createBottomNavigationBars(int index, ValueChanged<int> onChanged) {
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
    onPressed: () {
      NavigatorUtil.gotoScanQrPage(context);
    },
  );
}

Widget _createHomeBody(int index, BuildContext context) {
  if (index == 0) {
    final bannerList = [
      'resource/banner1.jpg',
      'resource/banner2.jpg',
      'resource/banner3.jpeg',
      'resource/banner4.jpg',
    ];
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.asset(
                bannerList[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: bannerList.length,
            containerHeight: 220,
            itemHeight: 220,
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
            autoplay: true,
          ),
        ),
        TitleButton(),
        Expanded(
          child: Container(
            //  color: Colors.greenAccent,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, count) {
                if (count % 5 == 0) {
                  return Container(
                    padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    color: Colors.white70,
                    height: 35,
                    child: Text(
                      '为你推荐歌单',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(fontSize: 17),
                    ),
                  );
                } else {
                  return ItemCell();
                }
              },
            ),
          ),
        )
      ],
    );
  } else if (index == 1) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (context, count) {
        return HomeContentCell();
      },
    );
  }
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: 100,
    itemBuilder: (context, count) {
      return MusicCell();
    },
  );
}

//Drawer userImage
Widget _userImage() {
  return Container(
      constraints: BoxConstraints(maxHeight: 90),
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 45.0,
        child: ClipOval(
            child: Image.asset(
          'resource/music2.jpeg',
          fit: BoxFit.cover,
          width: 90,
          height: 90,
        )),
      ));
}

//Drawer ListView
Widget _drawerListView() {
  const List<String> titleList = ['我的', '修改密码', '关于', '退出登录'];
  var pageList = [
    MinePage(
      title: titleList[0],
    ),
    ChangePSPage(title: titleList[1]),
    AboutPage(title: titleList[2])
  ];
  return Expanded(
    child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.account_box),
          title: Text('${titleList[index]}'),
          onTap: () {
            if (index < titleList.length - 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return pageList[index];
              }));
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

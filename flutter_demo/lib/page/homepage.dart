import 'package:flutter/material.dart';
import 'qrcodepage.dart';
import 'package:flutter_amap/flutter_amap.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/network/url.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterAmap amap = new FlutterAmap();
  
  void show(){
    amap.show(
        mapview: new AMapView(
            centerCoordinate: new LatLng(39.9242, 116.3979),
            zoomLevel: 13.0,
            mapType: MapType.night,
            showsUserLocation: true),
        title: new TitleOptions(title: "我的地图"));
    amap.onLocationUpdated.listen((Location location){

      print("Location changed $location") ;

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
      drawer: _createDrawer(),
      bottomNavigationBar: _createBottomNavigationBars(),
      floatingActionButton: _floatButton(context),
      backgroundColor: Colors.white,
    );
  }
}

Widget _createDrawer() {
  const List<String> titleArr = ['我的', '修改密码', '关于', '退出登录'];
  return Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.red,
                constraints: BoxConstraints(
                  maxHeight: 90
                ),
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
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text('${titleArr[index]}'),
                      onTap: () {
                        print('${titleArr[index]}');
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index){
                    return new Container(
                      color: Colors.grey,
                      height: 1,
                    );
                  },
                  itemCount: titleArr.length,
                ),
              ),
            ]
          ),
        ),
    );
}

//
Widget _createBottomNavigationBars() {
  return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.fastfood),
            title: Text('首页'),
            backgroundColor: Colors.blue,
            // activeIcon: new Icon(Icons.fast_forward),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.flag),
            title: Text('发现'),
            activeIcon: new Icon(Icons.fast_forward),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.question_answer),
            title: Text('推荐'),
            activeIcon: new Icon(Icons.fast_forward),
            backgroundColor: Colors.blue,
          )
        ],
        onTap: (index) async {
          print('$index');
          if (index == 2) {
            Dio dio = new Dio();
            Response<Map> response = await dio.get(Address.LogOutUrl);  
            print(response.data);
          }
        },
        currentIndex: 0,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
      );
}

Widget _floatButton(BuildContext context) {
  return FloatingActionButton(
    child: Text('Float'),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return ScanQrPage();
      }));
    },
  );
}
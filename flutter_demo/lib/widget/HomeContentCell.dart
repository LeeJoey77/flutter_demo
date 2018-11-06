import 'package:flutter/material.dart';
import 'package:flutter_demo/model/HomeListModel.dart';

class HomeContentCell extends StatefulWidget {
  HomeListModel model;
  HomeContentCell({this.model, Key key}): super(key: key);
  @override
  _HomeContentCellState createState() => _HomeContentCellState();
}

class _HomeContentCellState extends State<HomeContentCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
      child: Card(
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 15,
                      child: ClipOval(
                            child: Image.asset(
                              'resource/music1.jpeg',
                              fit: BoxFit.cover,
                              width: 30,
                              height: 30,
                            )
                        )
                    ),
                    SizedBox(width: 7,),
                    Expanded(child: Text('反误了卿卿性命'), flex: 5,),
                    Expanded(child: Text('10:11'), flex: 1,)
                  ],
                ),
                SizedBox(height: 10,),
                Text('王熙凤判词', 
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(height: 5,),
                Text('凡鸟偏从末世来，都知爱慕此生才；一从二令三人木，哭向金陵事更哀。\n机关算尽太聪明, 反误了卿卿性命。',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          )
      )
    );
  }
}
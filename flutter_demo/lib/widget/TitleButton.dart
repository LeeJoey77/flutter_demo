import 'package:flutter/material.dart';
import 'dart:math';

class TitleButton extends StatefulWidget {
  String title;
  TitleButton({ Key key, this.title }) : super(key: key);
  @override
  _TitleButtonState createState() => _TitleButtonState();
}

class _TitleButtonState extends State<TitleButton> {
  final musicImageList = [
    'resource/music1.jpeg', 
    'resource/music2.jpeg',
    'resource/music3.jpeg',
    'resource/music4.jpeg'
  ];
  final randomNum = Random().nextInt(4);
  @override
  Widget build(BuildContext contex) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 10,
        right: 20,
        bottom: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: _createTitleIcon(),
      ),
    );
  }
}

List<Widget> _createTitleIcon() {
  List titleList = ['歌手', '排行', '分类歌单', '电台', '视频'];
  List iconList = [
    Icons.supervised_user_circle,
    Icons.music_note,
    Icons.radio,
    Icons.video_library,
    Icons.sort
  ];
  List<Widget> list = [];
  for (int i = 0; i < 5; i++) {
    final icon = Expanded(
      child: Column(
            children: <Widget>[
              Icon(iconList[i], color: Colors.greenAccent, size: 32,),
              Text(titleList[i])
            ],
        ),
    );
    
    list.add(icon);
  };
  return list;

}
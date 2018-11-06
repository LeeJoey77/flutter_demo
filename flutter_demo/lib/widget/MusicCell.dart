import 'package:flutter/material.dart';
import 'dart:math';

class MusicCell extends StatefulWidget {
  @override
  _MusicCellState createState() => _MusicCellState();
}

class _MusicCellState extends State<MusicCell> {
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
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(musicImageList[randomNum],
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white54,
                        child: Icon(Icons.play_arrow, size: 50, color: Colors.white,),
                        radius: 25,
                      )
                      
                    ),
                  )
              ],
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('1 雪落下的声音(Live) - 林俊杰', style: TextStyle(fontSize: 15),),
                    SizedBox(height: 10,),
                    Text('2 Will You - 王源'),
                    SizedBox(height: 10,),
                    Text('3 故长安 - 张靓颖'),
                  ],
                ),
              )

            ],)
    );
  }
}
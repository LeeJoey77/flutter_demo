import 'package:flutter/material.dart';
import 'dart:math';

class ItemCell extends StatefulWidget {
  ItemCell({ Key key }) : super(key: key);
  @override
  _ItemCellState createState() => _ItemCellState();
}

class _ItemCellState extends State<ItemCell> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 15),
      child: Row(children: <Widget>[
        Expanded(child: _itemWidget(context),),
        SizedBox(width: 5,),
        Expanded(child:  _itemWidget(context)),
        SizedBox(width: 5,),
        Expanded(child:  _itemWidget(context))
      ],),
    );
    
  }

}

Widget _itemWidget(BuildContext context) {
  final kScreenWidth = MediaQuery.of(context).size.width;
  const imageNameList = [
    'resource/1.jpg',
    'resource/2.jpg',
    'resource/3.jpg',
    'resource/4.jpg',
    'resource/5.jpg',
  ];
  const singerNameList = [
    '李宇春',
    '赵又廷',
    '易烊千玺',
    '林俊杰',
    '李宇春'
  ];
  final index = Random().nextInt(5);
  return Stack(
    children: <Widget>[
      Image.asset(imageNameList[index],
        height: 110,
        width: (kScreenWidth - 15 * 2 - 10) / 3,
        fit: BoxFit.fill,
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        height: 17,
        child:  Container(
          color: Colors.white70,
          child: Text(singerNameList[index],
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(fontSize: 14),
            ),
        ),
      ),
    ],
  );
}
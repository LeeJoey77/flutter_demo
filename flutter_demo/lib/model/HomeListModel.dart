import 'package:flutter/material.dart';

class HomeListModel {
  int ID;
  Image avatar;
  String userName = 'userName';
  String time = 'time';
  String title = 'aadfalkfjalsnflanfasndf,mdsanf,mdsnfsfdasdf';
  String content = 'falsflasnfdnasf,mnas,mfnsd,mfnsd,mnf,dsmnf,dmsnfsd,mfnds,mf';

  HomeListModel({
    @required this.ID,
    this.userName, 
    this.avatar,
    this.time,
    this.title,
    this.content
  });
}
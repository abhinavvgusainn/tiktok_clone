import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/add_video.dart';
import 'package:tiktok/view/screens/display_screen.dart';
import 'package:tiktok/view/screens/search_screen.dart';

const backgrounfColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

List pageindex = [
  DisplayVideo_Screen(),
  SearchScreen(),
  addVideoScreen(),
  Text('meassage'),
  Text('profile'),
];

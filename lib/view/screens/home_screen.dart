import 'package:flutter/material.dart';
import 'package:tiktok/constant.dart';
import 'package:tiktok/view/widget/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageId = 0;

  @override
  Widget build(BuildContext context) {
    var customAddIcon;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageId,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgrounfColor,
        onTap: (value) => setState(() {
          pageId = value;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              label: 'Search'),
          BottomNavigationBarItem(icon: CustomAddIcon(), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 25,
              ),
              label: 'Comment'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: 'Profile'),
        ],
      ),
      body: Center(
        child: pageindex[pageId],
      ),
    );
  }
}

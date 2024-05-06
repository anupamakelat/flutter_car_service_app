// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drive_buddy/user/Account/account.dart';
import 'package:drive_buddy/user/home.dart';
import 'package:drive_buddy/user/Notification/notification.dart';

class MyNav extends StatefulWidget {
  const MyNav({super.key});

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  int indexNum = 0;
  List screen = [
    MyHome(),
    Account(),
    MyNotification(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 255, 255, 255),
        height: 60,
        animationCurve: Curves.ease,
        buttonBackgroundColor:   Color.fromARGB(255, 251, 252, 254),
        backgroundColor: Color.fromARGB(255, 241, 238, 238),
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            //color: Color.fromARGB(255, 37, 34, 34),
          ),
        
          Icon(Icons.account_circle_rounded, size: 30),
          Icon(CupertinoIcons.bell)
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            indexNum = index;
          });
        },
      ),
      body: screen[indexNum],
    );
  }
}

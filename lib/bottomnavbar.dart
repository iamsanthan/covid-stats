import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './global.dart';
import './precautions.dart';
import './countries.dart';
import './india.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final List<Widget> _routes=[Cases(),Countries(),India(),Precautions()];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(FontAwesomeIcons.globe, size:30),
            Icon(FontAwesomeIcons.solidFlag,size:30),
            Icon(CupertinoIcons.location_solid, size: 30),
            Icon(CupertinoIcons.news_solid, size: 30)
          ],
          color: Colors.blueGrey[50],
          buttonBackgroundColor: Colors.blue[300],
          backgroundColor: Colors.red,
          animationCurve: Curves.easeInOutQuad,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: _routes[_page],
      );
  }
}
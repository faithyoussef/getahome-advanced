import 'package:flutter/material.dart';
import 'package:untitled1/pages/explore.dart';
//import 'package:getahome/pages/messages.dart';
import 'package:untitled1/pages/settings.dart';
import 'package:untitled1/themes/color.dart';
import 'package:untitled1/widgets/bottombar_item.dart';

import 'favorites.dart';
import 'messages.dart';
import 'more.dart';
class BottomTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTab();
  }
}

class _BottomTab extends State<BottomTab> {
  int _selectedTabIndex = 0;

  List _pages = [
    ExplorePage(),
    settings(darkModeEnabled: true),
    favorites(),
    messages(),
    more(),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
      //print("index..." + index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('building'),
      ),
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedTabIndex,
            onTap: _changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey[500],
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.apartment),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.mail),
                label:'Messages',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_rounded),
                  label: 'More'),
            ],
          ),
        ));
  }
}
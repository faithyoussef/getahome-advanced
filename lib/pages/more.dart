
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class more extends StatefulWidget {
  const more({Key? key}) : super(key: key);

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 10, //notche margin between floating button and bottom appbar
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child:  Row( //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),)
          ),
        ),
    );
  }
}

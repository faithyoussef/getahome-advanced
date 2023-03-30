

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/pages/Posts.dart';
import 'package:untitled1/pages/home.dart';

import 'explore.dart';
import 'messages.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                    const ExplorePage()),
                  );
                },
                icon: Icon(color:Colors.deepPurple ,Icons.person,)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          post()
                  )
                  );
                },
                icon: Icon(color:Colors.deepPurple ,Icons.favorite,)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          HomePage()
                      )
                  );                },
                icon: Icon(color:Colors.deepPurple ,Icons.home,)),

             IconButton(
                 onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>
                   messages()
                   ),
                   );
                 }, icon: Icon(CupertinoIcons.mail_solid)),

            CircleAvatar(
                backgroundImage: AssetImage('images/flat.jpg'))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
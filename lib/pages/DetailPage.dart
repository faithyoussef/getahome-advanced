import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'About.dart';
import 'DetailAppBar.dart';
import 'HouseInfo.dart';
import 'content_intro.dart';

class DetailPage extends StatelessWidget {
 // final Route house;
  const DetailPage({Key? key, required Property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailAppBar(),
                SizedBox(height: 20),
                ContentIntro(name: ''),
                SizedBox(height: 20),
                HouseInfo(),
                SizedBox(height: 20),
                About(),
                SizedBox(height: 25),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text('Book Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)))))
              ],
            )));
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              MenuInfo(
                  imageUrl: 'images/house_05.jpg',
                  content: '5 Bedroom\n3 Master Bedroom'),
              MenuInfo(
                  imageUrl: 'images/house_06.jpg',
                  content: '5 Bathroom\n3 Toilet'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              MenuInfo(
                  imageUrl: 'images/kitchen.jpg',
                  content: '2 Kitchen\n120 sqft'),
              MenuInfo(
                  imageUrl: 'images/villa.png',
                  content: '2 Parking\n120 sqft'),
            ],
          )
        ],
      ),
    );
  }
}

class MenuInfo extends StatelessWidget {
  final String imageUrl;
  final String content;
  const MenuInfo({Key? key, required this.imageUrl, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          children: [

            SizedBox(width: 20),
            Text(
              content,
              style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
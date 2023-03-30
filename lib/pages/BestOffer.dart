
import 'package:flexible/flexible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/utils/building.dart';
import 'package:untitled1/widgets/icon_box.dart';

import '../utils/property.dart';

class BestOffer extends StatelessWidget {
  final listOfOffer = Property.generateBestOffer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Best Offer',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'See All',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    SizedBox(height: 10),
    ...listOfOffer
        .map((el) => Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8)),
           child: Stack(
          children: [
               Row(
         children: [
         Container(width: 100,
      height: 60,
      decoration: BoxDecoration(
       image: DecorationImage(
       image: AssetImage("images/house_03.jpg"),
       fit: BoxFit.cover
       ),
        borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(width: 10),
           Container(width: 100,
             height: 60,
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage("images/house_04.jpg"),
                     fit: BoxFit.cover
                 ),
                 borderRadius: BorderRadius.circular(8)),
           ),
         Column(
        children: [
          Text(
   " ",
    style: Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
    Text(
    " ",
    style: Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 12),
         )
        ],
       ),
      ],
     ),
    Positioned(
      right: 0,
        child: FilledButton.icon(
        onPressed: () {  },

          label: Text("more"), icon: Icon(Icons.more_horiz_outlined)),
         ),
        ],
       ),
       ))
        .toList()
      ],
     ),
    );
   }

  }

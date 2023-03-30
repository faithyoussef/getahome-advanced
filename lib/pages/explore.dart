import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/pages/MyMap.dart';
import 'package:untitled1/pages/home.dart';
import 'package:untitled1/themes/color.dart';
import 'package:untitled1/utils/building.dart';
import 'package:untitled1/utils/property.dart';
import 'package:untitled1/widgets/broker_item.dart';
import 'package:untitled1/widgets/company_item.dart';
import 'package:untitled1/widgets/custom_textbox.dart';
import 'package:untitled1/widgets/icon_box.dart';
import 'package:untitled1/widgets/recommend_item.dart';

import 'ItemDropDownButtonCategory.dart';

//import 'package:riverpod/riverpod.dart';
class ExplorePage extends StatefulWidget {
const ExplorePage({ Key? key }) : super(key: key);

@override
_ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  //late ItemDropDownButtonCategory _selectedCategory;
  //late final String dropdownValue ;
  void initstate(){
    //super.initstate();
 //_selectedCategory
    //dropdownValue = ItemDropDownButtonCategory.list[0];
  }
  final List<String> items = [
    'apartment',
    'villa',
    'building',
    'flat 1250*900',
    'small flat 900*600',
    'big flat 1500*200',
    'office',
    'shop'
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:(){},
            icon:Icon(Icons.info_outline)
          )
        ],
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff3366cc),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 70,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Icon(
                  Icons.add_circle_outline,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("create a new property",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "title",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Description",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Property example",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Price",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "dollars",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("space required",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "125 * 50 ",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Number of rooms",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "3",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("number of facilities",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "2",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Location",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      //color: Color(0xff3366cc),
                      //textColor: Colors.white,
                      //disabledColor: Colors.grey,
                      //disabledTextColor: Colors.black,
                    //  padding: EdgeInsets.all(8.0),
                    //  splashColor: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              MyMap()),
                        );
                      },
                      child: Text(
                        "required place,  city ",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Category",
                        style: TextStyle(color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child:DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                              'Select Item type',
                                style: TextStyle(
                                     fontSize: 14,
                            color: Theme.of(context).hintColor,
                               ),
                                 ),
                           items: items
                          .map((item) => DropdownMenuItem<String>(
                           value: item,
                            child: Text(
                               item,
                                style: const TextStyle(
                                   fontSize: 14,
                                 ),
                        ),
                     )).toList(),
                       value: selectedValue,
                     onChanged: (value) {
                       setState(() {
                        selectedValue = value as String;
                          });
                        },
                         buttonStyleData: const ButtonStyleData(
                                                                                                     height: 40,
                            width: 140,
                         ),
                          menuItemStyleData: const MenuItemStyleData(
                           height: 40,
              ),
        ),
      ),),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                    color: Colors.black26,
                  )
                ],
              ),
              ElevatedButton(
               // color: Color(0xff3366cc),
                //textColor: Colors.white,
               // disabledColor: Colors.grey,
              //  disabledTextColor: Colors.black,
              //  padding: EdgeInsets.all(8.0),
              //  splashColor: Colors.blueAccent,
                onPressed: () {
                  MaterialPageRoute(builder: (context)=> ExplorePage());
                  print("request have been sent");
                  /*...*/
                },
                child: Text(
                  "validate",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        )
    );
  }
}

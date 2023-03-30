import 'package:flutter/material.dart';
import 'package:untitled1/themes/color.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({
    Key? key, this.hint = "",
    this.prefix, this.suffix,
    this.controller, this.readOnly = false}) : super(key: key);
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Padding(
         padding: EdgeInsets.symmetric(horizontal: 2,
             vertical: 2),
         child: TextField(
         // maxLines: 5,
          readOnly: readOnly,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white),),),

              //prefixIcon: prefix,
              //suffixIcon: suffix,
             // border: InputBorder.none,
             //
             // hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),


    ), )]);
  }
}
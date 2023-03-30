import 'package:flutter/material.dart';
import 'package:untitled1/themes/color.dart';


class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon,
      this.title, {this.onTap,
   // this.color = inActiveColor,
  //  this.activeColor = const AppColors.kGrey200,
    this.isActive = false,
    this.isNotified = false});
  final IconData icon;
  final String title;
  //final Color color;
  //final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
       child: Column(
         children: [
          Container(
        alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isActive ?
                    AppColors.kDark.withOpacity(.1) : Colors.transparent,
                  ),
                  child: Icon(icon, size: 25,
                      color: AppColors.kGrey200)
              ),
              Positioned(
                  bottom: -8,
                  child: Icon(Icons.arrow_drop_up,
                      size: 20.0,
                      color:AppColors.kScaffold
                      //color: Colors.transparent
                    )
              ),
            ],
    ),    ),
         ],

       ),


      );
  }
}
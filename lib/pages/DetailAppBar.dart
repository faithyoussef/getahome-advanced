import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  //final Route house;
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Image.asset(
            "images/house_02.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                       // child: ,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                     // child: Images.asset(""),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
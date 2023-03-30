import 'package:flutter/material.dart';
import 'package:untitled1/themes/color.dart';

class IconBox extends StatelessWidget {
  IconBox({ Key? key, required this.child,
    this.bgColor, this.onTap,
    this.borderColor = Colors.transparent,
    this.radius = 50, required this.onPressed}) : super(key: key);
  final Widget child;
  final Color borderColor;
  final Color? bgColor;
  final double radius;
  final GestureTapCallback? onTap;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: AppColors.kDark.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}


class icon extends StatefulWidget {
  const icon({Key? key, required this.initNumber, required this.counterCallback, required this.increaseCallback, required this.decreaseCallback, required this.minNumber}) : super(key: key);

  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;
  final Function decreaseCallback;
  final int minNumber;

  @override
  State<icon> createState() => _iconState();
}

class _iconState extends State<icon> {

  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  //late Function onPressed;
  late int  _minNumber;

  @override
  void initstate(){
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ??(int Number){};
    _increaseCallback = widget.increaseCallback ?? (){};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    _minNumber = widget.minNumber ?? 0;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
         30
        ),
        color: Colors.lightGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
          Text(_currentCount.toString()),
          _createIncrementDicrementButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }
  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }
  Widget _createIncrementDicrementButton(
      IconData icon, onPressed){
    return RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
        onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.lightGreenAccent,
      child: Icon(
        icon,
        color: Colors.black12,
        size: 12.0,
      ),
      shape: CircleBorder(),
    );
  }
}

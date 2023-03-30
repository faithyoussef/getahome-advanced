import 'package:untitled1/pages/extension.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final VoidCallback? OnTap;
  final String? label;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;

  const Button(String s, {this.label,
    this.color,
    this.child,
    this.width,
    this.height,
    this.OnTap,
    Key? key, required  onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height ?? 49,
      child:
        ElevatedButton(
          onPressed: OnTap,
          style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            .copyWith(
            backgroundColor: MaterialStateProperty.all(color)
          ),
          child: child??
            Text(
              label!,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        )
    );
  }
}

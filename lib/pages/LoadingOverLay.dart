import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/apptheme.dart';
import '../themes/color.dart';

class LoadingOverLay extends StatelessWidget {
  const LoadingOverLay({Key? key, required this.child, required this.busy, required this.msg}) : super(key: key);
  final Widget child;
  final bool busy;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
         children: [
           child,
           if(busy) ...[
             ModalBarrier(
        dismissible: false, color: Colors.black.withOpacity(0.5)),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
         children: [
                CircularProgressIndicator(
              color: AppColors.kPrimary,
            ),
                           Padding(
                       padding: const EdgeInsets.only(top: Insets.sm),
                      child: Text(
                        msg,
                       style: context.textTheme.bodyMedium!.copyWith(
                       fontStyle: FontStyle.italic,
                        color: Colors.white,
                    ),
              ),
         ),

         ],
      ),
         ],],),
    );
  }
}

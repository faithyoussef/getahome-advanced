
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../themes/apptheme.dart';
import '../themes/color.dart';
import '../themes/input_validator.dart';

class InputTextField  extends StatelessWidget {
  InputTextField ({Key? key, required this.labelText, required this.hintText, required this.onSaved, this.inputFormatters, this.validator, this.controller, this.initialValue, this.keyboardType}) : super(key: key);
  final String labelText;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final _border = OutlineInputBorder(
    borderRadius: Corners.smBorder,
    borderSide: BorderSide(
      color: AppColors.kGrey,
      width: 1.4,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: controller,
         inputFormatters: inputFormatters,
            onSaved: onSaved,
        validator: validator ?? InputUtils.validateField,
        initialValue: initialValue,
        keyboardType: keyboardType,
        style: context.textTheme.bodyMedium!
            .copyWith(color: Colors.black, fontSize: FontSizes.s16),
               decoration: InputDecoration(
                  labelText: labelText,
                     hintText: hintText,
                     errorStyle:
                     context.textTheme.bodySmall!.copyWith(color: AppColors.kError),
                     labelStyle: context.textTheme.caption!.copyWith(color: AppColors.kGrey),
                     hintStyle:
                     context.textTheme.bodyMedium!.copyWith(color: AppColors.kGrey),
                     floatingLabelBehavior: FloatingLabelBehavior.auto,
                     isDense: true,
                     border: _border,
                     enabledBorder: _border,
                     focusedBorder: _border.copyWith(
                     borderSide: BorderSide(
                     color: AppColors.kPrimary,
                     width: 0.9,
             ),
    ), errorBorder: _border,
           focusedErrorBorder: _border,
               ), );
  }
}

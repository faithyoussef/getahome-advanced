//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:untitled1/themes/color.dart';

import '../themes/apptheme.dart';
import 'HostedImage.dart';
import 'date_formatter.dart';
import 'gap.dart';

class PropertyItem extends StatelessWidget {
  PropertyItem(this.property,{ Key? key,required this.onTap,
}) : super(key: key);
  final  property;
  final Function onTap;
  static const kHeight = SizedBox(height: 7);
  final DateFormatter dateFormatter = DateFormatter.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: 240,
      margin: const EdgeInsets.symmetric(
        vertical: Insets.sm,
        horizontal: Insets.md,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrey.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [kHeight,
        Hero(
          tag: ObjectKey(property.images.first),
          child: ClipRRect(
            borderRadius: Corners.smBorder,
            child: HostedImage(
                property.images.first.path,
                height: 200),
          ),
        ),
          kHeight,
          Text(
            property.desc,
            maxLines: 1,
            style: context.textTheme.subtitle1!.copyWith(
              color: AppColors.kDark,
              fontSize: FontSizes.s16,
            ),
          ),
          kHeight,
          Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(PhosphorIcons.bed, size: IconSizes.sm),
                  const Gap(2),
                  const Text("bed",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w600),),
                  SizedBox(height: 5,),
                  Gap.sm,
                  Row(
                    children: [
                      Icon(PhosphorIcons.toilet,
                        color: AppColors.kDark, size: 13,),
                      SizedBox(width: 3,),
                      Text("location", style: TextStyle(
                          fontSize: 13, color: AppColors.kDark),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("price", style: TextStyle(fontSize: 15,
                      color: AppColors.kPrimary, fontWeight: FontWeight.w500),),
                  Gap.sm,
                  Text('Posted ${dateFormatter.
                  relativeToNow(property.createdAt)}')
                ],
          ),
        ],
      ),
    );
  }
}
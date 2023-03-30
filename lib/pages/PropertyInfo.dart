


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:untitled1/pages/extension.dart';
import 'package:untitled1/widgets/HostedImage.dart';

import '../themes/apptheme.dart';
import '../themes/color.dart';
import '../widgets/date_formatter.dart';
import '../widgets/gap.dart';

class PropertyInfoPage extends StatelessWidget {
   PropertyInfoPage(this.property,
       {Key? key,}) : super(key: key);
  final DateFormatter dateFormatter = DateFormatter.instance;
   final property;
   late int _currentCount;
    late int counterCallback;
   void initstate(){
    // _currentCount = widget.counterCallback ?? (int number) {};

   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
               SizedBox(
                 height: 270,
                 child: PageView(
                   children:property.images
                       .map(
                         (e) => Hero(
                       tag: ObjectKey(e),
                       child: HostedImage(
                         e.path,
                         width: 40,
                         //width: ,
                       //  BoxFit fit:  BoxFit.fill,
                       ),
                     ),
                   )
                       .toList()),
                 ),
                 Padding(
                   padding:  EdgeInsets.all(Insets.md),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text(
                             property.desc,
                                style: Theme.of(context).textTheme.bodyLarge,
                             ),
                           Gap.sm,
                           Container(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: Insets.sm, vertical: Insets.xs),
                             decoration: BoxDecoration(
                               color: AppColors.kPrimary,
                               borderRadius: Corners.mdBorder,
                             ),
                             child: Text(
                               property.type,
                               style: Theme.of(context).textTheme.bodyMedium,
                               selectionColor: AppColors.kGrey,
                               ),
                             ),
                         ],
                       ),
                       Gap.sm,
                       Text(
                         property.address,
                           style: Theme.of(context).textTheme.bodyMedium,
                           selectionColor: AppColors.kDark,

                       ),
                       Gap.sm,
                       Wrap(
                         runSpacing: Insets.sm,
                         spacing: Insets.sm,
                         children: [
                           Icon(
                             semanticLabel: 'toilet',
                             PhosphorIcons.toilet,
                                 //: property.toilet,
                           //onPressed:(){}
    ),
                           Icon(
                             semanticLabel: 'bathroom',
                             PhosphorIcons.bathtub,
                            // itemCount: property.bathRoom,
                           ),
                           Icon(
                             semanticLabel: 'kitchen',
                             PhosphorIcons.cookingPot,
                            // itemCount: property.kitchen,
                           ),
                           Icon(
                             semanticLabel:  'bedroom',
                             PhosphorIcons.bed,
                           //  itemCount: property.bedRoom,
                           ),
                           Icon(
                             semanticLabel:   'sittingroom',
                             PhosphorIcons.houseSimple,
                           //  itemCount: property.sittingRoom,
                           ),
                         ],
                       ),
                       Gap.md,
                       const Divider(),
                       Gap.sm,
                       Text(
                         'First listed on: ${dateFormatter.datetimeToString(property.createdAt.toDateTime())}',
                       ),
                       Gap.sm,
                       const Divider(),
                       Gap.md,
                       Text(
                         'Valid from: ${dateFormatter.datetimeToString(property.validFrom.toDateTime())} to ${dateFormatter.datetimeToString(property.validTo.toDateTime())}',
                       ),
                       Gap.sm,
                       const Divider(),
                       Gap.md,
                       Text(
                         'Owner: ${property.owner}',
                       ),
                       Gap.md,
                       Gap.md,
                       Text(
                         'Edit this property',
                         style: Theme.of(context).textTheme.bodyMedium,

                         selectionColor: Colors.green[400]!,
                           //TextI: TextDecoration.underline,
                       ).onTap(
                               () => context.push(Navigator()),
                       ),],
                   ),
                 )
               ],
            ),
          ),
           Positioned(
            top: Insets.lg + Insets.md,
            left: Insets.md,
            child: IconButton(
              onPressed: () {  },
              icon: Icon(CupertinoIcons.back),)
          )
        ],
               ),
    );
  }
}


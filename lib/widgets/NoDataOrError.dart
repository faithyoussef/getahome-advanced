import 'package:flutter/cupertino.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../themes/apptheme.dart';
import '../themes/color.dart';
import 'gap.dart';

enum Variant {
  noData,
  error
}

class NoDataOrError extends StatelessWidget {
  const NoDataOrError(param0, {Key? key, required this.msg, required this.variant}) : super(key: key);
   final  String msg;
   final Variant variant;
  @override
  Widget build(BuildContext context) {
    final color =
    variant == Variant.noData ? AppColors.kGrey : AppColors.kError;
    return Padding(
      padding:  EdgeInsets.all(Insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
      child: Container(
      height: 64,
        width: 64,
        decoration: BoxDecoration(
          borderRadius: Corners.mdBorder,
          color: color.withOpacity(0.2),
          ),
            child: Icon(
              variant == Variant.noData
                  ? PhosphorIcons.rocketFill
                  : PhosphorIcons.finnTheHumanFill,
              color: color,
              size: IconSizes.lg,
            ),
          ),
          ),
          Gap.md,
          Text(msg, textAlign: TextAlign.center),
        ],
      )
    );
  }
}

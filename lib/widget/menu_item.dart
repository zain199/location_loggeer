import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_logger/theme/color.dart';
import 'package:location_logger/theme/config.dart';

import 'package:velocity_x/velocity_x.dart';

class MenuItem2 extends StatelessWidget {

  const MenuItem2({
    this.title,
    this.child,
    this.divider = true,
    this.topDivider = false,
    this.suffix,
    this.onPressed,
    this.ic,
    Key ?key,
  }) : super(key: key);

  //
  final String ?title;
  final Widget ?child;
  final bool ?divider;
  final bool ?topDivider;
  final Widget ?suffix;
  final Function? onPressed;
  final IconData ?ic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18)
      ),
      height: 60,
      child: MaterialButton(
        onPressed: (){},
        elevation: 0.6,
        color: Config().appaccentColor,
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        child: HStack(
          [

            Icon(ic ,color: Config().appColor, ),
            const SizedBox(width: 10,),
            (title!.text.gray600.lg.bold.make()).expand(),
          ],
        ),
      ),
    );
  }
}

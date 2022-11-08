import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Dohatana/theme/color.dart';
import 'package:Dohatana/theme/config.dart';

import 'package:velocity_x/velocity_x.dart';

class MenuItem2 extends StatelessWidget {

  const MenuItem2({
    this.title,
    this.child,
    this.divider = true,
    this.topDivider = false,
    this.suffix,
    this.onPressed,
    this.describtion,
    this.ic,
    Key ?key,
  }) : super(key: key);

  //
  final String ?title;
  final String ?describtion;
  final Widget ?child;
  final bool ?divider;
  final bool ?topDivider;
  final Widget ?suffix;
  final VoidCallback? onPressed;
  final IconData ?ic;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(
          color: Vx.gray200,
          blurRadius: 7,
          spreadRadius: 2,
          offset: Offset(0, 5)
        )]
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0.6,
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: HStack(
          [

            Icon(ic ,color: Config().appColor,),
            const SizedBox(width: 10,),
            VStack(
              [
                (title!.text.fontFamily(GoogleFonts.abel().fontFamily!).gray600.lg.bold.make()).expand(),
                (describtion!.text.fontFamily(GoogleFonts.abel().fontFamily!).gray400.sm.make()).expand(),
              ]
            )
          ],
        ).objectCenterLeft(),
      ),
    );
  }
}

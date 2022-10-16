import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widget/menu_item.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VStack(
        [
          //
          "Profile".i18n.text.xl2.semiBold.make(),
          "Profile & App Settings".i18n.text.lg.light.make(),

          //profile card
          //ProfileCard(model),

          VStack(
            [

              //profile card
              Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity,height: 14,),
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg',
                    ),
                    radius: 50,
                  ),
                  const SizedBox(height: 10,),
                  //name
                  //model.currentUser.name.text.xl.semiBold.make(),
                  Text('User Name' , style: Get.theme.textTheme.headline6,),
                  //email
                  //model.currentUser.email.text.light.make(),
                  Text('example@gmail.com', style: Get.theme.textTheme.caption!.copyWith(fontSize: 16),),

                  const SizedBox(width: double.infinity,height: 14,),

                ],
              ),


            ],
          )
              .wFull(context)
              .box
              .color(Colors.transparent)
              .make(),
          //menu
          VStack(
            [

              MenuItem2(
                title: "Delete Account",
               // onPressed: model.openWhoAreWeDialog,
                ic: Icons.delete,
              ),

              //
              //model.authenticated?
              MenuItem2(
                title: "Logout",
               // onPressed: model.logoutPressed,
                divider: false,
                ic: Icons.logout,
                // suffix: Icon(
                //   FlutterIcons.logout_ant,
                //   size: 16,
                // ),
              ),
              //



            ],
          ),

        ],
      ).p20().scrollVertical()
    );
  }
}

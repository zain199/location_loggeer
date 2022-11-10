import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../controllers/auth_controller.dart';
import '../../../widget/menu_item.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
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
                         CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(controller.currentUser!.profileImage!,),
                          radius: 50,
                        ),
                        const SizedBox(height: 10,),
                        //name
                        //model.currentUser.name.text.xl.semiBold.make(),
                        Text(controller.currentUser!.firstName!+ ' ' + controller.currentUser!.lastName! , style: Get.theme.textTheme.headline6,),
                        //email
                        //model.currentUser.email.text.light.make(),
                        Text(controller.currentUser!.email!, style: Get.theme.textTheme.caption!.copyWith(fontSize: 16,fontFamily: GoogleFonts.abel().fontFamily),),

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
                      title: controller.currentUser!.companyName,
                      describtion: 'This is Your Company Name',
                      onPressed: (){},
                      ic: Icons.home_work_outlined,
                    ),

                    //
                    //model.authenticated?
                    MenuItem2(
                      title: controller.currentUser!.contactNumber,
                      onPressed: (){},
                      describtion: 'This is Your Contact Number',
                      divider: false,
                      ic: Icons.phone,

                    ),

                    MenuItem2(
                      title: controller.currentUser!.designation,
                      describtion: 'This is Your Designation',
                      onPressed: (){},
                      ic: Icons.person,
                    ),

                    //
                    //model.authenticated?
                    MenuItem2(
                      title: controller.currentUser!.gender,
                      onPressed: (){},
                      describtion: 'This is Your Gender',
                      divider: false,
                      ic: Icons.transgender,

                    ),


                    MenuItem2(
                      title: "Delete Account",
                      describtion: 'Delete Your Account Will Remove All Your Data',
                      onPressed: () async {
                        await controller.deleteUserAccount();
                      },
                      ic: Icons.delete,
                    ),

                    //
                    //model.authenticated?
                    MenuItem2(
                      title: "Logout",
                      onPressed: controller.logout,
                      describtion: 'Logout From Your Account to Login With New Account',
                      divider: false,
                      ic: Icons.logout,

                    ),




                  ],
                ),

              ],
            ).p8().scrollVertical()
        );
      },
    );
  }
}

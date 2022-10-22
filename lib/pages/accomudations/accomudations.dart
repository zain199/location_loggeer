import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_logger/controllers/accommodation_controller.dart';
import 'package:location_logger/controllers/auth_controller.dart';
import 'package:location_logger/models/accommodation_model.dart';

import '../../Theme/config.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({Key? key}) : super(key: key);

  @override
  State<Accommodation> createState() => _AccommodationState();
}

//BUilding name,floor, caretaker name ,caretaker no

class _AccommodationState extends State<Accommodation> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AccommodationController controller = Get.put(AccommodationController());
      controller.getUserAccommodation();
    });
  }

  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accommodation',
          style: GoogleFonts.abel(
              fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Config().appaccentColor,
      ),

      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          GetBuilder<AccommodationController>(
            init: AccommodationController(),
            builder: (controller) {
              return controller.userAccommodation != null
                  ? Container(
                      height: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(

                              child :Column(

                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Location Name',
                                  style: Get.theme.textTheme.caption!
                                      .copyWith(fontWeight: FontWeight.w500,),
                                ),
                                SizedBox(width: Get.width,),
                                Text(controller.userAccommodation!.location??'El Tahrir',
                                    style: Get.theme.textTheme.subtitle2!
                                        .copyWith(fontWeight: FontWeight.w600,color: Colors.white)),
                              ],
                            ),
                            color: Config().appColor,
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          ),
                          SizedBox(height: 5,),
                         Container(
                           padding: EdgeInsets.all(16),
                           child:  Column(
                             children: [

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [

                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Building No.',
                                         style: Get.theme.textTheme.caption,
                                       ),
                                       Text(controller.userAccommodation!.buildingNo??'Cairo Tower',
                                           style: Get.theme.textTheme.subtitle1!
                                               .copyWith(fontWeight: FontWeight.w500)),
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Floor No.',
                                         style: Get.theme.textTheme.caption,
                                       ),
                                       Text(controller.userAccommodation!.flatNo??'Number 14',
                                           style: Get.theme.textTheme.subtitle1!
                                               .copyWith(fontWeight: FontWeight.w500)),
                                     ],
                                   ),
                                 ],
                               ),
                               Divider(
                                 color: Colors.grey,
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Care taker Name',
                                         style: Get.theme.textTheme.caption,
                                       ),
                                       Text(controller.userAccommodation!.careTakerName??'Omar Ali',
                                           style: Get.theme.textTheme.subtitle1!
                                               .copyWith(fontWeight: FontWeight.w500)),
                                     ],
                                   ),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Care taker Contact No.',
                                         style: Get.theme.textTheme.caption,
                                       ),
                                       Text(controller.userAccommodation!.careTakerContactNo??'250',
                                           style: Get.theme.textTheme.subtitle1!
                                               .copyWith(fontWeight: FontWeight.w500)),
                                     ],
                                   ),
                                 ],
                               )
                             ],
                           ),
                         )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: Offset(0, 5))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                    )
                  : Expanded(
                      child: Center(
                      child: Text('There is no Accommodation For You'),
                    ));
            },
          ),
        ],
      ),
    );
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:location_logger/common/helper_methods.dart';
import 'package:location_logger/controllers/schedules_controller.dart';
import 'package:location_logger/models/schedule_model.dart';
import 'package:location_logger/utils/constant.dart';

class ScheduleItem extends StatelessWidget {
  final ScheduleModel scheduleModel;
  const ScheduleItem({Key? key,required this.scheduleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulesController controller = Get.put(SchedulesController());
    int colorIndex = randomNumber();
    return Container(
      // padding: EdgeInsets.v(12),
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8),

      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3)
          )],
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors[colorIndex],
              borderRadius: BorderRadius.circular(16),
            ),
            width: 6,
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(height: 10,),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Time', style: Get.theme.textTheme.caption),
                    Text(
                        scheduleModel.startTime??'12:00',
                        style: Get.theme.textTheme.subtitle1)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Time', style: Get.theme.textTheme.caption),
                    Text(
                        scheduleModel.endTime??'12:00',
                        style: Get.theme.textTheme.subtitle1)
                  ],
                ),

                SizedBox(height: 10,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 3),
            color: Colors.grey[300],
            width: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scheduleModel.stadium??'This is a Title',
                      style: Get.theme.textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      scheduleModel.date??DateFormat('dd MMM , yyyy').format(DateTime.now()).toString(),
                      style: Get.theme.textTheme.caption!.copyWith(fontSize: 14,fontFamily: GoogleFonts.abel().fontFamily),
                    ),
                  ],
                ),

                Row(
                  children: [
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Icon(Icons.circle_outlined,size: 8,color: colors[colorIndex],),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 3.0,top: 3,),
                    //       child: Column(
                    //         children: [
                    //           SizedBox(
                    //             height: 8,
                    //             child: DottedLine(
                    //               direction: Axis.vertical,
                    //               lineThickness: 2,
                    //               dashGapLength: 1,
                    //
                    //               dashColor: colors[colorIndex],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 8,
                    //             child: DottedLine(
                    //               direction: Axis.vertical,
                    //               lineThickness: 2,
                    //               dashGapLength: 1,
                    //
                    //               dashColor: colors[colorIndex],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 8,
                    //             child: DottedLine(
                    //               direction: Axis.vertical,
                    //               lineThickness: 2,
                    //               dashGapLength: 1,
                    //
                    //               dashColor: colors[colorIndex],
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 8,
                    //             child: DottedLine(
                    //               direction: Axis.vertical,
                    //               lineThickness: 2,
                    //               dashGapLength: 1,
                    //
                    //               dashColor: colors[colorIndex],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Icon(Icons.circle_outlined,size: 8,color : colors[colorIndex]),
                    //   ],
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Container(
                      width: Get.width*.55,
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              scheduleModel.area??'This is a Location Area',
                              style: Get.theme.textTheme.headline6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  width: Get.width*.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: isScheduleDateIsToday()?()async{
                          await controller.checkIn(date: scheduleModel.date!);
                        }:null, child: Text('Check in',style: TextStyle(color: Colors.white,fontFamily: GoogleFonts.abel().fontFamily),),style: ElevatedButton.styleFrom(
                          backgroundColor: colors[colorIndex],


                        ),),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(onPressed: isScheduleDateIsToday()?()async{
                          await controller.checkOut(date: scheduleModel.date!);
                        }:null, child: Text('Check out',style: TextStyle(color: Colors.white,fontFamily: GoogleFonts.abel().fontFamily),),style: ElevatedButton.styleFrom(
                          backgroundColor: colors[colorIndex],
                        ),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isScheduleDateIsToday()
  {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return (todayDate == scheduleModel.date);
  }
}

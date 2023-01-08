
import 'dart:developer';

import 'package:Dohatana/controllers/auth_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:Dohatana/common/helper_methods.dart';
import 'package:Dohatana/controllers/schedules_controller.dart';
import 'package:Dohatana/models/schedule_model.dart';


class ScheduleItem extends StatelessWidget {
  final ScheduleModel scheduleModel;

  const ScheduleItem({Key? key, required this.scheduleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulesController controller = Get.put(SchedulesController());
    AuthController authController = Get.put(AuthController());
    int colorIndex = randomNumber();


    return Container(
      // padding: EdgeInsets.v(12),
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8),

      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3))
      ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
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
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Time', style: Get.theme.textTheme.caption),
                    Text(
                        scheduleModel.startTime ?? '12:00',
                        style: Get.theme.textTheme.subtitle1)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Time', style: Get.theme.textTheme.caption),
                    Text(
                        scheduleModel.endTime ?? '12:00',
                        style: Get.theme.textTheme.subtitle1)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
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
                      scheduleModel.stadium ?? 'This is a Title',
                      style: Get.theme.textTheme.headline1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      scheduleModel.date ??
                          DateFormat('dd MMM , yyyy')
                              .format(DateTime.now())
                              .toString(),
                      style: Get.theme.textTheme.caption!.copyWith(
                          fontSize: 14,
                          fontFamily: GoogleFonts.abel().fontFamily),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: Get.width * .55,
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              scheduleModel.area ?? 'This is a Location Area',
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
                  width: Get.width * .55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                          isScheduleDateIsToday(getDateFormatted(scheduleModel.date!) +' '+getTimeFormatted(scheduleModel.startTime!)) ?
                                  () async {
                                      await controller.checkIn(
                                          date: scheduleModel.date! , context: context , ScheduleDate: scheduleModel.date!+scheduleModel.startTime! , userId:  authController.currentUser!.userId!);
                                    }
                              : null,
                          child: Text(
                            'Check in',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.abel().fontFamily),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors[colorIndex],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                          isScheduleDateIsToday(getDateFormatted(scheduleModel.date!) +' '+getTimeFormatted(scheduleModel.startTime!))  ?
                                  () async {
                                      await controller.checkOut(
                                          date: scheduleModel.date! , context: context , ScheduleDate: scheduleModel.date!+scheduleModel.startTime! , userId:  authController.currentUser!.userId!);

                                    }
                                  : null,
                          child: Text(
                            'Check out',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: GoogleFonts.abel().fontFamily),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors[colorIndex],
                          ),
                        ),
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


  String getDateFormatted(String date) {
    String currentDate = date;
    String formattedDate = '';

    formattedDate += currentDate.split('-').first;

    if (currentDate.split('-')[1].length < 2) {
      formattedDate += '0' + currentDate.split('-')[1];
    } else
      formattedDate += currentDate.split('-')[1];

    if (currentDate.split('-').last.length < 2) {
      formattedDate += '0' + currentDate.split('-').last;
    } else
      formattedDate += currentDate.split('-').last;

    return formattedDate;
  }


  String getTimeFormatted(String time) {
    String currentTime = time;
    String formattedTime = '';

    if(currentTime.split(' ').last=='AM')
      formattedTime=currentTime.split(' ').first+':00';
    else {
      int hours = int.parse(currentTime.split(':').first)+12;
      String newHours='';
      if(hours==24)hours=0;
      newHours = hours==0?'00':hours.toString();
      formattedTime = newHours+':'+currentTime.split(' ').first.split(':').last+':00';
    }


    return formattedTime;
  }

  bool isScheduleDateIsToday(String dateTime) {
    log(DateTime.now().toString());
    log(DateTime.parse(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(dateTime))).toString());
    return (DateTime.now().isBefore(DateTime.parse(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(dateTime))).add(Duration(days: 1))))&& DateTime.now().isAfter(DateTime.parse(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(dateTime))));
  }


}

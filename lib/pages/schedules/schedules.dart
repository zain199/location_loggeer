import 'dart:developer';

import 'package:Dohatana/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Dohatana/controllers/schedules_controller.dart';
import 'package:Dohatana/pages/schedules/components/schedule_item.dart';
import 'package:intl/intl.dart';

import '../../common/constants/assets.dart';
import '../../theme/config.dart';

class Schedules extends StatefulWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedules',
          style: GoogleFonts.abel(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Config().appaccentColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(logo),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<SchedulesController>(
              init: SchedulesController()..getUserSchedules(),
              builder: (controller) {
                return controller.schedulesList.isNotEmpty
                    ? ListView(
                        padding: EdgeInsets.all(8),
                        children: List.generate(controller.schedulesList.length, (index) {


                          if (isThisDateFrom24HoursFromItsStartTime((getDateFormatted(controller.schedulesList[index].date!)+' '+getTimeFormatted(controller.schedulesList[index].startTime!)))) {
                            return SizedBox();
                          }

                            return ScheduleItem(scheduleModel: controller.schedulesList[index],);


                        }),
                      )
                    : Center(
                        child: Text('There are No Schedules For You'),
                      );
              },
            ),
          )
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

  // schedule not shown if more than 24 hours ago
  bool isThisDateFrom24HoursFromItsStartTime(String dateTime)
  {

    // log(dateTime);
    // log(DateTime.now().subtract(Duration(days: 1)).toString());
    // log(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(dateTime)).toString());

    return (DateTime.now().subtract(Duration(days: 1)).isAfter(DateTime.parse(
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(dateTime)))));
  }

  bool isThisDateGoneFromMoreThanOneDay(String dateTime)
  {
    return DateTime.now().isAfter(DateTime.parse(dateTime));
  }

  // if  date is 8/12 or before or after but until start time  =====> active

  // if date is 8/12 and today is 9/12 at 10 am ===> inactive

  // if date is 8/12 and today is 9/12 before 10 am ===> active




  // if today is after one day of schedule day and time is before start time ==> active
  bool isScheduleDateIsToday(String dateTime) {
    return (DateTime.now().isAfter(DateTime.parse(dateTime).add(Duration(days: 1)))&& DateTime.now().isBefore(DateTime.parse(dateTime)) );
  }
}

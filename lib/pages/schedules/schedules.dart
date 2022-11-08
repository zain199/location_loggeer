import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:Dohatana/controllers/schedules_controller.dart';
import 'package:Dohatana/pages/schedules/components/schedule_item.dart';

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
          style: GoogleFonts.abel(
              fontSize: 26, fontWeight: FontWeight.bold),
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
                return controller.schedulesList.isNotEmpty?ListView(
                  padding: EdgeInsets.all(8),
                  children: List.generate(
                      controller.schedulesList.length,
                          (index) {
                        if(DateTime.now().isAfter(DateTime.parse(getDateFormatted(controller.schedulesList[index].date!)+' 00:00:00')))
                           return SizedBox();

                        return ScheduleItem(scheduleModel: controller.schedulesList[index],);
                          }),
                ):Center(child: Text('There are No Schedules For You'),);
              },
            ),
          )
        ],
      ),
    );
  }
  
  String getDateFormatted(String date)
  {
    String currentDate = date;
    String formattedDate = '';
    
    formattedDate += currentDate.split('-').first;
    
    if(currentDate.split('-')[1].length<2)
      {
        formattedDate+='0'+currentDate.split('-')[1];
      }else
      formattedDate+=currentDate.split('-')[1];

    if(currentDate.split('-').last.length<2)
    {
      formattedDate+='0'+currentDate.split('-').last;
    }else
      formattedDate+=currentDate.split('-').last;
    
    return formattedDate;
  }
}

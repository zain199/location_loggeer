import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:location_logger/controllers/schedules_controller.dart';
import 'package:location_logger/pages/schedules/components/schedule_item.dart';

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
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg'),
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
                          (index) => ScheduleItem(scheduleModel: controller.schedulesList[index],)),
                ):Center(child: Text('There are No Schedules For You'),);
              },
            ),
          )
        ],
      ),
    );
  }
}

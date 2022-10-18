import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
    return Column(
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.maxFinite,
          color: Config().appaccentColor,
          child: SafeArea(
            child: Row(
              children: [
                Text(
                  'Location Logger',
                  style: GoogleFonts.akayaTelivigala(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg'),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: List.generate(
                5,
                (index) => ScheduleItem()),
          ),
        )
      ],
    );
  }
}

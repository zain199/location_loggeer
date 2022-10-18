import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location_logger/common/helper_methods.dart';

import '../../../Theme/config.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int colorIndex = randomNumber();
    return Container(
      // padding: EdgeInsets.v(12),
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8),

      decoration: BoxDecoration(

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
                        DateFormat('hh:mm a').format(DateTime.now()).toString(),
                        style: Get.theme.textTheme.subtitle1)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('End Time', style: Get.theme.textTheme.caption),
                    Text(
                        DateFormat('hh:mm a').format(DateTime.now()).toString(),
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
              children: [
                Text(
                  'This is a Title',
                  style: Get.theme.textTheme.headline2,
                ),
                Text(
                  DateFormat('dd MMM , yyyy').format(DateTime.now()).toString(),
                  style: Get.theme.textTheme.caption!.copyWith(fontSize: 16),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.circle_outlined,size: 8,color: colors[colorIndex],),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0,top: 3,),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  lineThickness: 2,
                                  dashGapLength: 1,

                                  dashColor: colors[colorIndex],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  lineThickness: 2,
                                  dashGapLength: 1,

                                  dashColor: colors[colorIndex],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  lineThickness: 2,
                                  dashGapLength: 1,

                                  dashColor: colors[colorIndex],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  lineThickness: 2,
                                  dashGapLength: 1,

                                  dashColor: colors[colorIndex],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.circle_outlined,size: 8,color : colors[colorIndex]),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: Get.width*.55,
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'This is a Location name',
                              style: Get.theme.textTheme.subtitle1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey[300],
                            width: Get.width*.45,
                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 8),
                          ),
                          Expanded(
                            child: Text(
                              'This is a Location Area',
                              style: Get.theme.textTheme.subtitle1,
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
                  width: Get.width*.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text('Entry',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                        backgroundColor: colors[colorIndex],


                      ),),
                      ElevatedButton(onPressed: (){}, child: Text('Exit',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                        backgroundColor: colors[colorIndex],
                      ),),
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
}

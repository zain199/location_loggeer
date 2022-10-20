import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/config.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({Key? key}) : super(key: key);

  @override
  State<Accommodation> createState() => _AccommodationState();
}

//BUilding name,floor, caretaker name ,caretaker no

class _AccommodationState extends State<Accommodation> {
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
                    (index) =>Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Building Name',style: Get.theme.textTheme.caption,),
                                  Text('Cairo Tower in Tahrir',style: Get.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Floor No.',style: Get.theme.textTheme.caption,),
                                  Text('Number 14',style: Get.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
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
                                  Text('Caretaker Name',style: Get.theme.textTheme.caption,),
                                  Text('Omar Ali',style: Get.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Caretaker No.',style: Get.theme.textTheme.caption,),
                                  Text('Number 250',style: Get.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 3)
                          )],
                          color: Colors.white, borderRadius: BorderRadius.circular(16)),
                    ),),
          ),
        )
      ],
    );
  }
}

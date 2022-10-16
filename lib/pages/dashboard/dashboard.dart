import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/config.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.maxFinite,
          color: Config().appaccentColor,
          child: SafeArea(
            child: Row(
              children: [
                Text('Location Logger',style:  GoogleFonts.getFont('Lato'),),
                const Spacer(),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://i.pinimg.com/736x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

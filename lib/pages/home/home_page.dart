import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_logger/theme/config.dart';

import '../dashboard/dashboard.dart';
import 'component/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int current = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Dashboard(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Config().appaccentColor,
        buttonBackgroundColor: Config().appColor,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 200),
        height: 45.0,
        items:const  [
          Icon(
           Icons.home_outlined,
            size: 30.0,
            color: Colors.black54,
          ),
          Icon(
            Icons.person_outline,
            size: 30.0,
            color: Colors.black54,
          ),
        ],
        onTap: (index) {

          setState(() {
            current = index;
            _pageController.jumpToPage(current);
          });
        },
        index: current,
      ),
    );
  }
}

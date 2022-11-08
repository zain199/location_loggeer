import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:Dohatana/theme/config.dart';
import '../accomudations/accomudations.dart';
import '../schedules/schedules.dart';
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
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Schedules(),
          Accommodation(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Config().appaccentColor,
        buttonBackgroundColor: Config().appColor,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 200),
        height: 45.0,
        items:  [
          Icon(
            Icons.schedule_outlined,
            size: 30.0,
            color:current==0? Colors.white:Colors.black54,
          ),
          Icon(
           Icons.home_outlined,
            size: 30.0,
            color: current==1? Colors.white:Colors.black54,
          ),
          Icon(
            Icons.person_outline,
            size: 30.0,
            color:current==2?  Colors.white:Colors.black54,
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

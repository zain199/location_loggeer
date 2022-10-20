import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:location_logger/pages/login/login_screen.dart';
import 'package:location_logger/theme/theme_model.dart';

final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeModel().lightMode, // Provide light theme.
      home: Login(),
    );
  }
}

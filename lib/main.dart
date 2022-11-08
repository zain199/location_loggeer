import 'package:Dohatana/pages/login/login_screen.dart';
import 'package:Dohatana/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';


import 'controllers/auth_controller.dart';

final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
   Get.put(AuthController());
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

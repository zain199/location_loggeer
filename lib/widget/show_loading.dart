import 'package:flutter/material.dart';
import 'package:location_logger/Theme/config.dart';

import '../main.dart';

void showLoading({Color? loadingColor})
{
  showDialog<String>(
    barrierDismissible: false,
    context: navigatorKey.currentContext!,
    barrierColor: Colors.black38,
    builder: (BuildContext context) =>
      WillPopScope (
        onWillPop: () async {
          return false;
        },
        child:  AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: CircularProgressIndicator(
              color: Config().appaccentColor,
            ),
          ),
        ),
      )
  );
}
void hideLoading() => Navigator.pop(navigatorKey.currentContext!);
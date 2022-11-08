import 'package:flutter/material.dart';
import 'package:Dohatana/Theme/config.dart';

import '../main.dart';

void showLoading({Color? loadingColor, String? msg})
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
          content: Container(
            //width: 80,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Config().appaccentColor,
                  ),
                ),
                SizedBox(height: 10,),
                if(msg!=null)
                Text(msg,style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      )
  );
}
void hideLoading() => Navigator.pop(navigatorKey.currentContext!);
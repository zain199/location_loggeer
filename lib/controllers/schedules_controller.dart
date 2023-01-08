import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:Dohatana/common/constants/variables-methods.dart';
import 'package:Dohatana/models/user_model.dart';
import 'package:Dohatana/pages/login/login_screen.dart';
import 'package:Dohatana/utils/constant.dart';
import 'package:Dohatana/widget/show_loading.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../common/constants/end_points.dart';
import '../common/helpers/get_connect_helper.dart';
import '../models/schedule_model.dart';

class SchedulesController extends GetxController {
  List<ScheduleModel> schedulesList = [
   ];

  Future<bool> getUserSchedules() async {
    try {
      //showLoading(msg: 'Loading...');
      Response res = await GetConnectHelper.getData(
          path: schedules, query: {'user_id': getUserId()});
      // hideLoading();
      if (res.statusCode == 200) {
        schedulesList.clear();

        // schedulesList.add(ScheduleModel.fromJson({
        //   'stadium': 'LUS',
        //   'area': 'LUS VILLA',
        //   'date': '2022-12-07',
        //   'program': 'MBS',
        //   'start_time': '09:44 PM',
        //   'end_time': '08:00 PM'
        // }));
        //
        // schedulesList.add(ScheduleModel.fromJson({
        //   'stadium': 'LUS',
        //   'area': 'LUS VILLA',
        //   'date': '2022-12-08',
        //   'program': 'MBS',
        //   'start_time': '11:00 AM',
        //   'end_time': '08:00 PM'
        // }));
        //
        // schedulesList.add(ScheduleModel.fromJson({
        //   'stadium': 'LUS',
        //   'area': 'LUS VILLA',
        //   'date': '2022-12-09',
        //   'program': 'MBS',
        //   'start_time': '11:00 AM',
        //   'end_time': '08:00 PM'
        // }));
        //
        //

        debugMessage('data is ' + res.body.toString());
        if (res.body is List<dynamic>) {
          List<dynamic> resData = res.body;
          resData.forEach((element) {
            schedulesList.add(ScheduleModel.fromJson(element));
          });
          update();
        }

        return true;
      }
      return false;
    } catch (error) {
      //  hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }

  Future<LocationData> getMyLocation() async {
    return await Location().getLocation();
  }


  Future<bool> checkIn({required String date , required BuildContext context , required String userId , required String ScheduleDate }) async {
    try {
      showLoading(msg: 'Loading...');
      bool isCheckedIn = await isThisDateCheckedIn(userId: userId,ScheduleDate: ScheduleDate);
      if(!isCheckedIn)
      {
        await addCheckInValue(userId: userId, ScheduleDate: ScheduleDate);

        LocationData currentLocation = await getMyLocation();
        Response res = await GetConnectHelper.getData(path: attend, query: {
          'userId': getUserId(),
          'longitude': currentLocation.longitude.toString(),
          'latitude': currentLocation.latitude.toString(),
          'date': date,
          'time': DateFormat('hh:mm').format(DateTime.now()),
          'type': '1',
        });
        hideLoading();

        debugMessage(res.statusCode.toString());
        if (res.statusCode == 200) {

          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Checked in Successfully!',
          );

          AudioPlayer().play(AssetSource('audio/bell.mp3'));
          return true;
        }
      }else
        {
          hideLoading();
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Your checked in already registered',
          );

        }

      return false;
    } catch (error) {
      hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }


  Future<bool> checkOut({required String date , required BuildContext context , required String userId , required String ScheduleDate }) async {
    try {
      showLoading(msg: 'Loading...');
      bool isCheckedIn = await isThisDateCheckedOut(userId: userId,ScheduleDate: ScheduleDate);

      if(!isCheckedIn)
        {
          await addCheckOutValue(userId: userId, ScheduleDate: ScheduleDate);
          LocationData currentLocation = await getMyLocation();
          Response res = await GetConnectHelper.getData(path: attend, query: {
            'userId': getUserId(),
            'longitude': currentLocation.longitude.toString(),
            'latitude': currentLocation.latitude.toString(),
            'date': date,
            'time': DateFormat('hh:mm').format(DateTime.now()),
            'type': '2',
          });

          debugMessage(res.statusCode.toString());
          hideLoading();

          if (res.statusCode == 200) {

            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Checked out Successfully!',
            );

            AudioPlayer().play(AssetSource('audio/bell.mp3'));
            return true;
          }
        }else
          {
            hideLoading();
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'Your checked in already registered',
            );
          }



      return false;
    } catch (error) {
      hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }

  Future<bool> isThisDateCheckedIn({required String userId , required String ScheduleDate})async
  {
    try {

      QuerySnapshot<Map<String, dynamic>> res =   await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Schedules')
          .doc(ScheduleDate)
          .collection('checkIn')
          .get();

      return (res.size>0);
    } catch (e) {
      debugMessage(e.toString());
      showErrorToast(e.toString());
      return false;
    }
  }


  Future<bool> isThisDateCheckedOut({required String userId , required String ScheduleDate})async
  {
    try {

      QuerySnapshot<Map<String, dynamic>> res =   await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Schedules')
          .doc(ScheduleDate)
          .collection('checkout')
          .get();

      return (res.size>0);
    } catch (e) {
      debugMessage(e.toString());
      showErrorToast(e.toString());
      return false;
    }
  }

  Future addCheckInValue({required String userId , required String ScheduleDate}) async {
    try {

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Schedules')
          .doc(ScheduleDate)
          .collection('checkIn')
          .add({'checkIn' : true});
      showSuccessToast('Checked in Added Successfully');
    } catch (e) {
      debugMessage(e.toString());
      showErrorToast(e.toString());
    }
  }


  Future addCheckOutValue({required String userId , required String ScheduleDate}) async {
    try {

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Schedules')
          .doc(ScheduleDate)
          .collection('checkout')
          .add({'checkout' : true});
      showSuccessToast('Checked out Added Successfully');
    } catch (e) {
      debugMessage(e.toString());
      showErrorToast('Something went wrong');
    }
  }

}

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:location_logger/common/constants/variables-methods.dart';
import 'package:location_logger/models/user_model.dart';
import 'package:location_logger/pages/login/login_screen.dart';
import 'package:location_logger/utils/constant.dart';
import 'package:location_logger/widget/show_loading.dart';

import '../common/constants/end_points.dart';
import '../common/helpers/get_connect_helper.dart';
import '../models/schedule_model.dart';

class SchedulesController extends GetxController {
  List<ScheduleModel> schedulesList = [];

  Future<bool> getUserSchedules() async {
    try {
      //showLoading(msg: 'Loading...');
      Response res = await GetConnectHelper.getData(
          path: schedules, query: {'user_id': getUserId()});
      // hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        schedulesList.clear();
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

  Future<bool> checkIn({required String date}) async {
    try {

      showLoading(msg: 'Loading...');
      LocationData currentLocation = await getMyLocation();
      Response res = await GetConnectHelper.getData(path: attend, query: {
        'userId': getUserId(),
        'longitude': currentLocation.longitude.toString(),
        'latitude': currentLocation.latitude.toString(),
        'date': date,
        'time':DateFormat('hh:mm').format(DateTime.now()),
        'type': '1',
      });
       hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        showSuccessToast('You Checked In Successfully');
        return true;
        }


      return false;
    } catch (error) {
      hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }


  Future<bool> checkOut({required String date}) async {
    try {
      showLoading(msg: 'Loading...');
      LocationData currentLocation = await getMyLocation();
      Response res = await GetConnectHelper.getData(path: attend, query: {
        'userId': getUserId(),
        'longitude': currentLocation.longitude.toString(),
        'latitude': currentLocation.latitude.toString(),
        'date': date,
        'time':DateFormat('hh:mm').format(DateTime.now()),
        'type': '2',
      });

      debugMessage(res.statusCode.toString());
      hideLoading();
      if (res.statusCode == 200) {
        showSuccessToast('You Checked Out Successfully');
        return true;
      }


      return false;
    } catch (error) {
      hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }


}

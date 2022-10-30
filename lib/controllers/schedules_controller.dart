import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location_logger/common/constants/variables-methods.dart';
import 'package:location_logger/models/user_model.dart';
import 'package:location_logger/pages/login/login_screen.dart';
import 'package:location_logger/utils/constant.dart';
import 'package:location_logger/widget/show_loading.dart';

import '../common/constants/end_points.dart';
import '../common/helpers/get_connect_helper.dart';
import '../models/schedule_model.dart';

class SchedulesController extends GetxController {

  List<ScheduleModel> schedulesList=[];

  Future<bool> getUserSchedules() async {
    try {
      //showLoading(msg: 'Loading...');
      Response res = await GetConnectHelper.getData(
          path: schedules, query: {'user_id': getUserId()});
     // hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        schedulesList.clear();
        debugMessage('data is '+res.body.toString());

        schedulesList.add(ScheduleModel(area: 'A1',date: '2022-11-02',endTime: '07:00',stadium: 'AAS',program: 'MBS',startTime: '09:00'));
        update();
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




}

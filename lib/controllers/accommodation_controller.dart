import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Dohatana/common/constants/variables-methods.dart';
import 'package:Dohatana/models/accommodation_model.dart';
import 'package:Dohatana/models/user_model.dart';
import 'package:Dohatana/pages/login/login_screen.dart';
import 'package:Dohatana/utils/constant.dart';
import 'package:Dohatana/widget/show_loading.dart';

import '../common/constants/end_points.dart';
import '../common/helpers/get_connect_helper.dart';

class AccommodationController extends GetxController {

  AccommodationModel? userAccommodation;

  Future<bool> getUserAccommodation() async {
    try {
      showLoading(msg: 'loading...');
      debugMessage(getUserId().toString());
      Response res = await GetConnectHelper.getData(
          path: accommodation, query: {'user_id': getUserId()});
      hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        debugMessage(res.body.toString());
        userAccommodation = AccommodationModel.fromJson(res.body);
        update();
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

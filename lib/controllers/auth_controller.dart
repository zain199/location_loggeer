import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:location_logger/common/constants/variables-methods.dart';
import 'package:location_logger/models/user_model.dart';
import 'package:location_logger/utils/constant.dart';
import 'package:location_logger/widget/show_loading.dart';

import '../common/constants/end_points.dart';
import '../common/helpers/get_connect_helper.dart';

class AuthController extends GetxController {
  UserModel? currentUser;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      showLoading();
      Response res = await GetConnectHelper.getData(
          path: loginEndPoint, query: {'email': email, 'password': password});
      hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        debugMessage(jsonDecode(res.body.toString()));
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

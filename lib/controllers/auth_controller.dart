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

class AuthController extends GetxController {

  UserModel? currentUser;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      showLoading(msg: 'Login...');
      Response res = await GetConnectHelper.getData(
          path: loginEndPoint, query: {'email': email, 'password': password});
      hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        debugMessage(res.body.toString());
        currentUser = UserModel(userId: res.body['user_id']);
        debugMessage(currentUser!.userId!);
        
        return getUserProfile(user_id: currentUser!.userId!);

      }
      return false;

    } catch (error) {
      hideLoading();
      showErrorToast(error.toString());
      debugMessage(error.toString());
      return false;
    }
  }


  Future<bool> getUserProfile({
      required String user_id
  }) async {
    try {
      showLoading(msg: 'Loading User Data...');
      Response res = await GetConnectHelper.getData(
          path: profile, query: {'user_id': user_id});
      hideLoading();
      debugMessage(res.statusCode.toString());
      if (res.statusCode == 200) {
        debugMessage(res.body.toString());
        currentUser = UserModel.fromJson(res.body);
        await GetStorage().write('user', res.body);
        await GetStorage().write('userid', currentUser!.userId);
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


  Future<bool> tryAutoLogin() async {
    try {
      showLoading(msg: 'Loading...');
      Map<String,dynamic>? cachedUser = await getUser();
      hideLoading();
      debugMessage(cachedUser.toString());
      if (cachedUser!= null) {
        currentUser = UserModel.fromJson(cachedUser);
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


  Future logout() async {
    try {

      currentUser = null;
      await GetStorage().remove('user');
      update();
      Get.offAll(Login());
    } catch (error) {
      showErrorToast(error.toString());
      debugMessage(error.toString());

    }
  }


}


import 'package:dio/dio.dart';

import '../../utils/constant.dart';


class DioHelper {
  static Dio dio=Dio(BaseOptions(
    baseUrl: 'https://api.gmind.app/api/',
    receiveDataWhenStatusError: true,
  ),
  );



  static Future<Response> getData(
      {
        required String path,
        Map<String, dynamic>? query,
        bool? isEmailAndPasswordRequired,

      }) async {

    return await dio.get(path, queryParameters: query,);
  }

  static Future<Response> setData(
      {
        required String path,
        Map<String, dynamic>? query,
        required data,

      }) async {

    debugMessage(dio.options.headers.toString()+' freom set');

    return await dio.post(
      path,
      data:data,
      queryParameters: query,

    );
  }

  static Future<Response> putData(
      {
        required String path,
        Map<String, dynamic>? query,
        required data,

      }) async {

    return await dio.put(
      path,
      data:data,
      queryParameters: query,
    );
  }


}
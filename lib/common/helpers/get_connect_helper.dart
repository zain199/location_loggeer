
import 'package:get/get_connect/connect.dart';

import '../../utils/constant.dart';


class GetConnectHelper {
  static GetConnect connect =GetConnect();

  // Dio(BaseOptions(
  //   baseUrl: 'https://api.gmind.app/api/',
  //   receiveDataWhenStatusError: true,
  // ),
  // );
  static String baseUrl = 'https://dohatnahrms.com/api';



  static Future<Response> getData(
      {
        required String path,
        Map<String, dynamic>? query,
        bool? isEmailAndPasswordRequired,

      }) async {

    debugMessage(baseUrl+path);
    debugMessage(query.toString());

    return await connect.get(baseUrl+path, query: query);
  }

  // static Future<Response> setData(
  //     {
  //       required String path,
  //       Map<String, dynamic>? query,
  //       required data,
  //
  //     }) async {
  //
  //   debugMessage(connect.options.headers.toString()+' freom set');
  //
  //   return await connect.post(
  //     path,
  //     data:data,
  //     queryParameters: query,
  //
  //   );
  // }
  //
  // static Future<Response> putData(
  //     {
  //       required String path,
  //       Map<String, dynamic>? query,
  //       required data,
  //
  //     }) async {
  //
  //   return await connect.put(
  //     path,
  //     data:data,
  //     queryParameters: query,
  //   );
  // }


}
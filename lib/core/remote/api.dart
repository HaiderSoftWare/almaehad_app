import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:oxford/controller/auth/login_controller.dart';

import '../static/api_url.dart';

class Api {
  static Dio dio = Dio();
  static final login_Controller = Get.put(LoginController());
  static Map<String, dynamic>? headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': login_Controller.token,
  };

  static Future<Response> loginUser({String? email, String? password}) async {
    return await dio.post(
      loginUrl,
      data: {
        'account_email': email,
        'account_password': password,
      },
    );
  }

  static Future<Response> getNews() async {
    return dio.get(
      newsUrl,
      options: Options(headers: headers),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxford/core/remote/api.dart';

import '../../pages/bottom_navigations.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  String token = '';
  RxBool isLoading = false.obs;
  loginUser() async {
    isLoading(true);
    try {
      final response =
          await Api.loginUser(email: email.text, password: password.text);
      if (response.statusCode == 200) {
        token = response.data['results']['token'];
        Get.to(BottomNavi());
        print(response.data);
        isLoading(false);

        print('============ TOKEN ========$token');
        return response.data;
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar(
        'Error',
        'The data entered is incorrect',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      );
    }
  }
}

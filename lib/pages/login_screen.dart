import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxford/controller/auth/login_controller.dart';
import 'package:sizer/sizer.dart';

import 'shared/constant/colors.dart';
import 'shared/function/function.dart';
import 'shared/widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> globalKey = GlobalKey();

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: globalKey,
            child: Obx(
              () {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: PrimaryKD),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        //  color: SecondKD2,
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            SecondKD2,
                            SecondKD1,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 2.h, right: 4.w, left: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/img/logo11.png',
                                height: 22.h,
                                width: 50.w,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                'معهد اوكسفورد الحديث التعليمي ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                CustomCard(
                                  icon: 'assets/img/1-05.png',
                                  title: 'أتصل بنا ',
                                ),
                                SizedBox(width: 4.w),
                                CustomCard(
                                  icon: 'assets/img/1-03.png',
                                  title: 'أعلانات',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            TitleTextFeild(
                              title: 'بريد الاكتروني',
                              icon: 'assets/img/1-10.png',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomField(
                              controller: controller.email,
                              obscureText: false,
                              // hinttext: 'Phone',
                              validatorf: (text) => vinputphne(text),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TitleTextFeild(
                              title: 'كلمه المرور',
                              icon: 'assets/img/1-10.png',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomField(
                              controller: controller.password,
                              obscureText: false,
                              // hinttext: 'Password',
                              validatorf: (text) => vinputpassword(text),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'نسيت كلمه المرور',
                              style: TextStyle(
                                color: PrimaryKD,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Material(
                                    color: PrimaryKD,
                                    borderRadius: BorderRadius.circular(16),
                                    child: InkWell(
                                      onTap: () {
                                        // Get.to(BottomNavi());
                                        controller.loginUser();
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 6.h,
                                        child: Center(
                                          child: Text(
                                            'تسجيل الدخول',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  String title;
  String icon;
  CustomCard({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: PrimaryKD,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            icon,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class TitleTextFeild extends StatelessWidget {
  String title;
  String icon;
  TitleTextFeild({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          icon,
          width: 14.w,
        ),
      ],
    );
  }
}

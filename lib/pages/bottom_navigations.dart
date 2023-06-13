import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxford/pages/home_screen.dart';

import 'package:sizer/sizer.dart';


import 'shared/constant/colors.dart';
import '../controller/bottom_navi_controller.dart';
import 'account_screen.dart';

class BottomNavi extends StatelessWidget {
  BottomNavi({super.key});

  List<Widget> pages = [
    const AccountScreen(),
    const AccountScreen(),
    const AccountScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            selectedLabelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            unselectedItemColor: SecondKD1,
            selectedItemColor: SecondKD1,
            currentIndex: controller.index,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/1-07.png',
                  width: 6.h,
                  height: 5.h,
                ),
                label: 'الامتحانات',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/1-10.png',
                  width: 6.h,
                  height: 5.h,
                ),
                label: 'الحساب',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/1-09.png',
                  width: 6.h,
                  height: 5.h,
                ),
                label: 'تقييم الطالب ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/img/1-08.png',
                  width: 6.h,
                  height: 5.h,
                ),
                label: 'الرئيسية',
              ),
            ],
          ),
          body: pages[controller.index],
        );
      },
    );
  }
}

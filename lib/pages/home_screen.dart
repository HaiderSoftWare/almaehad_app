import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:oxford/pages/shared/function/function.dart';
import 'package:sizer/sizer.dart';

import '../../model/sections.dart';
import 'shared/constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: PrimaryKD),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(66),
                  topRight: Radius.circular(66),
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: SecondKD2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(66),
                  topRight: Radius.circular(66),
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 1.5.h, right: 4.w, left: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/img/1-13.png',
                          width: 11.w,
                        ),
                        const Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'اسم الطالب',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            Text(
                              'الصف',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/img/1-14.png',
                          width: 11.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.7.h,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.6,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            _currentIndex = index;
                            setState(() {});
                          },
                        ),
                        items: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/img/news1.jpg',
                              fit: BoxFit.cover,
                            ),
                            // image: AssetImage(
                            //   "",
                            // ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/img/news1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/img/news1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: DotsIndicator(
                        dotsCount: 3,
                        position: _currentIndex,
                        decorator: DotsDecorator(
                          color: Colors.white,
                          activeColor: PrimaryKD,
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Image.asset(
                          'assets/img/1-12.png',
                        ),
                        Positioned(
                          right: 75,
                          bottom: 28,
                          child: Text(
                            'التعليم الاكتروني',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.1.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/img/1-11.png',
                        ),
                        Positioned(
                          right: 75,
                          bottom: 42,
                          child: Text(
                            'الامتحانات اليوميه',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        clipBehavior: Clip.hardEdge,
                        itemCount: sectionsDate.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 12.h,
                            crossAxisSpacing: 3.w,
                            childAspectRatio: 0.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 1.5.h),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              moveScreens(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      SecondKD2,
                                      SecondKD1,
                                    ],
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 1,
                                      offset: Offset(1, 1), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    sectionsDate[index].image.toString(),
                                    width: 19.w,
                                    height: 8.h,
                                  ),
                                  Text(
                                    sectionsDate[index].title.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

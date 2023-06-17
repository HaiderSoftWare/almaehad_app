import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxford/controller/news_controller.dart';
import 'package:oxford/pages/shared/function/function.dart';
import 'package:sizer/sizer.dart';

import '../model/sections.dart';
import 'news/dateil_news.dart';
import 'shared/constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newsController = Get.put(NewsController());

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
                    Obx(
                      () => newsController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    newsController.news.value.results!.length,
                                itemBuilder: (context, index) {
                                  return CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 2.6,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: false,
                                      onPageChanged: (index, reason) {
                                        newsController.changeIndex(index);
                                      },
                                    ),
                                    items: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            //move to detail news
                                            Get.to(const DetailScreen());
                                          },
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                'assets/img/news1.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                right: 16,
                                                top: 40,
                                                child: Text(
                                                  '${newsController.news.value.results![index].latestNewsTitle}',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                    ),
                    Obx(
                      () => Center(
                        child: DotsIndicator(
                          dotsCount: newsController.news.value.results!.length,
                          position: newsController.currentIndex.value,
                          decorator: DotsDecorator(
                            color: Colors.white,
                            activeColor: PrimaryKD,
                          ),
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
                      flex: 2,
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
                    ),
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

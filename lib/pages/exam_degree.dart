import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'shared/widget/my_appbar.dart';
import 'shared/widget/my_color.dart';

class ExamDegree extends StatefulWidget {
  const ExamDegree({Key? key}) : super(key: key);

  @override
  _ExamDegreeState createState() => _ExamDegreeState();
}

class _ExamDegreeState extends State<ExamDegree> {
  //late SwiperController _controller;

  @override
  void initState() {
    // _controller = SwiperController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("الدرجات"),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // _controller.previous(animation: true);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.purple,
                ),
              ),
              const Text(
                'الرياضات',
                style: TextStyle(
                    color: MyColor.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  //  _controller.next(animation: true);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: MyColor.purple,
                ),
              ),
            ],
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.0, color: MyColor.purple),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: MyColor.purple.withOpacity(.3)),
                            child: const ListTile(
                              title: Text(
                                "المادة",
                                style: TextStyle(
                                    color: MyColor.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                "الكلية/الدرجة",
                                style: TextStyle(
                                    color: MyColor.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                //_data[val.indexTable]['exams_name'],
                                itemCount: 6,
                                itemBuilder:
                                    (BuildContext context, int indexes) {
                                  return const ListTile(
                                    title: Text(
                                      'degree',
                                      style: TextStyle(
                                          color: MyColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(
                                      'Haider Majid' "/" '100',
                                      style: TextStyle(
                                          color: MyColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ));
              },
              onIndexChanged: (int index) {},
              itemCount: 9,
              //  controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}

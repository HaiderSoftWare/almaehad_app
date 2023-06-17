import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../shared/widget/my_color.dart';
import '../shared/widget/my_appbar.dart';

class StudentDriver extends StatefulWidget {
  const StudentDriver({super.key});

  @override
  _StudentDriverState createState() => _StudentDriverState();
}

class _StudentDriverState extends State<StudentDriver> {
  //final String _date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String? _date;

  @override
  void initState() {
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectBirthday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().add(const Duration(days: -365)),
        locale: const Locale("en", "US"),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      _date = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("الخطوط"),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: Get.height / 6,
              height: Get.height / 6,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: MyColor.purple),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  shape: BoxShape.rectangle),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset('assets/img/graduated.png'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Column(
              children: [
                AutoSizeText(
                  "الطالب",
                  maxLines: 1,
                  minFontSize: 15,
                  maxFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyColor.black),
                ),
                AutoSizeText(
                  'Haider Majid',
                  maxLines: 1,
                  minFontSize: 15,
                  maxFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MyColor.purple),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Column(
          //   children: [
          _listTile("تم الصعود الى الخط", false, null),
          _listTile("تم الوصول للمدرسة", false, null),
          _listTile("تم الصعود من المدرسة", false, null),
          _listTile("تم الوصول للمنزل", false, null),
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: MyColor.purple),
            child: TextButton(
              onPressed: () {
                Get.snackbar(
                    "ملاحظة", "هذه الميزة غير مفعلة,الرجاء الاتصال بالمدرسة",
                    colorText: Colors.white, backgroundColor: Colors.orange);
              },
              child: const Text(
                "GPS",
                style: TextStyle(
                    color: MyColor.white0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Center(
            child: Text(
              "تتبع",
              style: TextStyle(color: MyColor.purple),
            ),
          ),
        ],
      ),
    );
  }

  _listTile(_title, _value, _date) {
    return Theme(
      data: ThemeData(
          unselectedWidgetColor: MyColor.purple,
          primarySwatch: MyColor().yellowMaterial),
      child: CheckboxListTile(
        title: Text(
          _title,
          style: const TextStyle(
              color: MyColor.purple, fontWeight: FontWeight.bold),
        ),
        selected: false,
        onChanged: (_) {},
        value: _value,
        secondary: _date == null
            ? null
            : Text(
                _date.toString(),
                style: const TextStyle(color: MyColor.purple),
              ),
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: MyColor.purple,
      ),
    );
  }
}

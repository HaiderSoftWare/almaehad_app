import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxford/pages/student_salary_details.dart';

import 'shared/widget/my_appbar.dart';
import 'shared/widget/my_color.dart';

class StudentSalary extends StatefulWidget {
  const StudentSalary({Key? key}) : super(key: key);

  @override
  State<StudentSalary> createState() => _StudentSalaryState();
}

class _StudentSalaryState extends State<StudentSalary> {
  DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("الاقساط"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _listTile(
                //
                "اقساط السنة الكلية",
                "900 الف", //${val.currencySymbol}
                Colors.white),
            _listTile(
                "الخصم",
                "200 الف", //${val.currency}
                Colors.red.withOpacity(0.2)),
            _listTile(
                "الواصل",
                "600 الف", //${val.currency}
                Colors.green.withOpacity(0.2)),
            const Divider(
              color: Colors.black,
            ),
            _listTile(
                "المبلغ المتبقي", "20 الف", Colors.white.withOpacity(0.1)),
            _listTile("المبلغ المتبقي الكلي", "50 الف",
                Colors.white.withOpacity(0.1)),
            // _listTile(
            //     "المبلغ المتبقي الكلي",
            //     "${formatter.format(val.allSalary)} ${val.currency}",
            //     Colors.white.withOpacity(0.1)),
            const Spacer(),
            TextButton(
              onPressed: () => Get.to(() => const StudentSalaryDetails()),
              child: const Text(
                "التفاصيل",
                style: TextStyle(
                    color: MyColor.purple,
                    decoration: TextDecoration.underline),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 18, bottom: 10),
                child: Text(
                  "ملاحظة",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: RichText(
                  text: const TextSpan(
                    text: 'القسط القادم في تاريخ ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2023/10/8',
                        style: TextStyle(color: Colors.redAccent, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}

//StudentSalaryAPI
_listTile(String _title, String _money, Color _color) {
  return Container(
    color: _color,
    child: ListTile(
      title: Text(
        _title,
        style:
            const TextStyle(color: MyColor.black, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        _money,
        style: const TextStyle(
            color: MyColor.purple, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

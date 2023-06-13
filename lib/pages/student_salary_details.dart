import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'shared/widget/my_appbar.dart';

class StudentSalaryDetails extends StatefulWidget {
  const StudentSalaryDetails({Key? key}) : super(key: key);

  @override
  State<StudentSalaryDetails> createState() => _StudentSalaryDetailsState();
}

class _StudentSalaryDetailsState extends State<StudentSalaryDetails> {
  final formatter = NumberFormat.decimalPattern();
  DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("تفاصيل الاقساط"),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int indexes) {
            return Card(
              child: Column(
                children: [
                  listTile('6', "النوع", null),
                  listTile('null', "التاريخ", null),
                  listTile('null', "التفاصيل", null),
                  listTile('7', "المبلغ", '8'),
                  listTile('9', "المدفوع", '6'),
                  listTile('7', "الخصم", '5'),
                  listTile('6', "المتبقي", '8'),
                ],
              ),
            );
          }),
    );
  }
}

ListTile listTile(String title, String leading, String? trailing) {
  return ListTile(
    title: Text(title),
    leading: Text(leading),
    trailing: trailing == null ? null : Text(trailing),
  );
}

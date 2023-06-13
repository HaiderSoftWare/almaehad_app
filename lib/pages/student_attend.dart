import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'shared/widget/my_appbar.dart';
import 'shared/widget/my_color.dart';

class StudentAttend extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _search = TextEditingController();
  DateTime selectedDateBirthday = DateTime.now();
  String? firstDate;
  String? secondDate;
  int page = 0;

  StudentAttend({super.key});

  Future<void> _selectRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      locale: const Locale("en", "US"),
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final _formattedDateFirst =
          intl.DateFormat('yyyy-MM-dd').format(picked.start);
      final _formattedDateSecond =
          intl.DateFormat('yyyy-MM-dd').format(picked.end);
      firstDate = _formattedDateFirst;
      secondDate = _formattedDateSecond;
      _search.text = "من $_formattedDateFirst الى $_formattedDateSecond";
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("الحضور"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 350),
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: TextFormField(
              maxLines: 1,
              autofocus: false,
              controller: _search,
              cursorRadius: const Radius.circular(16.0),
              cursorWidth: 2.0,
              textInputAction: TextInputAction.done,
              minLines: 1,
              onTap: () {
                _selectRange(context);
              },
              enableInteractiveSelection: true,
              readOnly: true,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  labelText: "بحث حسب التاريخ",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10),
                  fillColor: MyColor.white4,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: MyColor.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: MyColor.white4,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: MyColor.white4,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: MyColor.red,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  filled: true
                  //fillColor: Colors.green
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widgetCount("عدد المحاضرات", 1),
                widgetCount("العدد الحالي", 2),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widgetCount("اجازة", 4),
                widgetCount("غياب", 4),
                widgetCount("حضور", 4),
              ],
            ),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minWidth: 200, maxWidth: 350),
              margin: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int indexes) {
                    return listTileData('Haider', '23');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget listTileData(String _absenceType, String _date) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: _color(_absenceType).withOpacity(0.25),
        borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      title: Text(
        _date.toString(),
        style:
            const TextStyle(color: MyColor.purple, fontWeight: FontWeight.bold),
      ),
      trailing: _text(_absenceType),
    ),
  );
}

Widget _text(String _text) {
  if (_text == "vacation") {
    return const Text(
      "اجازة",
      style: TextStyle(color: MyColor.purple, fontWeight: FontWeight.bold),
    );
  } else if (_text == "absence") {
    return const Text(
      "غياب",
      style: TextStyle(color: MyColor.purple, fontWeight: FontWeight.bold),
    );
  } else {
    return const Text(
      "حضور",
      style: TextStyle(color: MyColor.purple, fontWeight: FontWeight.bold),
    );
  }
}

Color _color(String _text) {
  if (_text == "vacation") {
    return MyColor.purple;
  } else if (_text == "absence") {
    return MyColor.red;
  } else {
    return MyColor.green;
  }
}

Widget widgetCount(String _title, int _count) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: MyColor.purple,
        ),
        borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 5, left: 5, top: 0, bottom: 0),
            padding: const EdgeInsets.all(3),
            child: Text(
              _title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: MyColor.purple, shape: BoxShape.circle),
          child: Text(
            _count.toString(),
            style: const TextStyle(fontSize: 13, color: MyColor.yellow),
          ),
        )
      ],
    ),
  );
}

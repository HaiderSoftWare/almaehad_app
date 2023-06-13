import 'package:flutter/material.dart';

import 'my_color.dart';

AppBar myAppBar(String _title) {
  return AppBar(
    backgroundColor: Colors.blueAccent,
    title: Text(
      _title,
      style: const TextStyle(color: MyColor.white0, fontSize: 26),
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: MyColor.white0,
    ),
    elevation: 0,
  );
}

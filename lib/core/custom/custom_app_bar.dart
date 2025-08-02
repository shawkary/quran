import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget? customAppBar({
  required BuildContext context,
  required String text1,
  String text2 = '',
  bool centerTitle = false,
  Color? backgroundColor,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: backgroundColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent),
    centerTitle: centerTitle,
    title: Text(text1,
        style: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Text(text2,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      )
    ],
  );
}

import 'components.dart';
import 'shared_pref.dart';
import 'package:azkar/features/quran/presentation/view/widgets/center_edge.dart';
import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

navigateToAndRemove(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void getGozName() {
  for (int i = 0; i < 30; i++) {
    if (pageNum! >= alAgzaaPages.values.toList()[i]) {
      gozName = alAgzaaPages.keys.toList()[i];
    }
  }
}

void getGozNum(BuildContext context) {
  for (int i = 0; i < 30; i++) {
    if (gozName == alAgzaaPages.keys.toList()[i]) {
      gozNum = i + 1;
    }
    if (pageNum! == alAgzaaPages.values.toList()[i]) {
      showOverlay(context);
    }
  }
}

void getSauraName() {
  for (int i = 0; i < 114; i++) {
    if (pageNum! == sauraPage.values.toList()[i] &&
        onePageThreeSaura.contains(pageNum)) {
      sauraName =
          '${sauraPage.keys.toList()[i - 2]} | ${sauraPage.keys.toList()[i - 1]} | ${sauraPage.keys.toList()[i]}';
    } else if (pageNum! == sauraPage.values.toList()[i] &&
        onePageTwoSaura.contains(pageNum)) {
      sauraName =
          '${sauraPage.keys.toList()[i - 1]} | ${sauraPage.keys.toList()[i]}';
    } else if (pageNum! >= sauraPage.values.toList()[i]) {
      sauraName = sauraPage.keys.toList()[i];
    }
  }
}

void cacheData() {
  SharedPref.saveString('sauraName', sauraName);
  SharedPref.saveString('gozName', gozName);
  SharedPref.saveInt('cachedPage', pageNum!);
}

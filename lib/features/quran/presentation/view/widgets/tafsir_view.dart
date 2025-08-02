import '../../../../../core/custom/custom_app_bar.dart';
import '../../../../../core/tafsir/ayat.dart';
import '../../../../../core/tafsir/tafsir.dart';
import '../../../../../core/utiles/components.dart';
import 'package:flutter/material.dart';

class TafsirView extends StatefulWidget {
  const TafsirView({super.key});

  @override
  State<TafsirView> createState() => _TafsirViewState();
}

class _TafsirViewState extends State<TafsirView> {
  late PageController pageController;
  late int page;
  @override
  void initState() {
    pageController = PageController(initialPage: pageNum! - 1);
    page = pageNum! - 1;
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, text1: 'التفسير الميسر', centerTitle: true),
      body: PageView.builder(
        reverse: true,
        controller: pageController,
        onPageChanged: (value) => setState(() => page = value),
        itemBuilder: (BuildContext context, int index) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              if (pagesAyat[page][index] != pagesTafsir[page][index]) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      pagesAyat[page][index],
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pagesTafsir[page][index],
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).canvasColor),
                    ),
                  ],
                );
              } else {
                return Text(
                  '-<( ${pagesAyat[page][index]} )>-',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                );
              }
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: pagesAyat[page].length,
          );
        },
        itemCount: 604,
      ),
    );
  }
}

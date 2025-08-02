import '../../../../../core/custom/custom_app_bar.dart';
import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/components.dart';
import '../../../../../core/utiles/shared_pref.dart';
import '../quran_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Agzaa extends StatefulWidget {
  const Agzaa({super.key});

  @override
  State<Agzaa> createState() => _AgzaaState();
}

class _AgzaaState extends State<Agzaa> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(
        initialScrollOffset: SharedPref.getDouble('savedOffset2') ?? 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        statusBarIconBrightness: Brightness.light));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SharedPref.saveDouble('savedOffset2', savedOffset2);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: customAppBar(context: context, text1: 'الصفحة', text2: 'الجزء'),
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: ListView.separated(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            savedOffset2 = scrollController.offset;
            return MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              onPressed: () {
                pageNum = alAgzaaPages[alAgzaaPages.keys.toList()[index]];
                showEdges = !showEdges;
                getGozName();
                getGozNum(context);
                getSauraName();
                cacheData();
                navigateToAndRemove(context, const QuranView());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 40,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).canvasColor, width: 1)),
                    child: Center(
                      child: Text(
                        '${alAgzaaPages.values.toList()[index]}',
                        style: TextStyle(
                            color: Theme.of(context).canvasColor, fontSize: 15),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    alAgzaaPages.keys.toList()[index],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).canvasColor, width: 1)),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 10,
            thickness: 1,
            color: Theme.of(context).canvasColor,
          ),
          itemCount: alAgzaaPages.length,
        ),
      ),
    );
  }
}

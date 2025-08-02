import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/components.dart';
import '../../manager/quran_cubit/cubit.dart';
import '../../manager/theme_cubit/theme_cubit.dart';
import 'bottom_edge.dart';
import 'top_edge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({super.key});

  @override
  State<QuranViewBody> createState() => _QuranViewBodyState();
}

class _QuranViewBodyState extends State<QuranViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: pageNum! - 1);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (pageNum! > 1 && pageNum! < 604) {
      precacheImage(
          AssetImage('assets/images/quran_images/${pageNum! + 1}.jpg'),
          context);
      precacheImage(
          AssetImage('assets/images/quran_images/${pageNum! - 1}.jpg'),
          context);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    var orientation = MediaQuery.of(context).orientation;
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => cubit.showEdgesFn(),
          child: Stack(
            children: [
              PageView.builder(
                reverse: true,
                onPageChanged: (value) {
                  pageNum = value + 1;
                  changePage = !changePage;
                  cubit.changePages();
                  getGozNum(context);
                  cubit.cacheImages(context, value);
                },
                controller: pageController,
                itemBuilder: (context, index) {
                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return orientation == Orientation.portrait
                          ? Image.asset(
                              'assets/images/quran_images/${index + 1}.jpg',
                              fit: BoxFit.fill,
                              color: Theme.of(context).canvasColor,
                              colorBlendMode: BlendMode.difference,
                            )
                          : Image.asset(
                              'assets/images/quran_images/${index + 1}.jpg',
                              fit: BoxFit.fill,
                              color: Theme.of(context).canvasColor,
                              colorBlendMode: BlendMode.difference,
                            );
                    },
                  );
                },
                itemCount: 604,
              ),
              if (showEdges) BottomEdge(cubit: cubit),
              if (showEdges) TopEdge(cubit: cubit),
              if (signedPage == pageNum)
                Container(
                  color: Colors.red.withValues(alpha: 0.8),
                  width: 30,
                  height: 100,
                  margin: const EdgeInsets.only(left: 60),
                ),
            ],
          ),
        );
      },
    );
  }
}

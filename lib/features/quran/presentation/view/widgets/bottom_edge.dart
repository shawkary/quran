import 'dart:io';
import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/components.dart';
import '../../../../../core/custom/containers.dart';
import '../../manager/quran_cubit/cubit.dart';
import '../../manager/theme_cubit/theme_cubit.dart';
import '../quran_view.dart';
import 'agzaa.dart';
import 'fehres.dart';
import '../../../../search/presentation/views/search_view.dart';
import 'tafsir_view.dart';
import '../../../../zekr/presentation/views/zekr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomEdge extends StatelessWidget {
  const BottomEdge({super.key, required this.cubit});
  final QuranCubit cubit;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
              height: 0,
              thickness: MediaQuery.sizeOf(context).width * .0075,
              color: Colors.grey),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    pageNum = signedPage;
                    getSauraName();
                    getGozName();
                    showEdges = !showEdges;
                    navigateToAndRemove(context, const QuranView());
                  },
                  child: ContainerBottomEdge(
                    height: MediaQuery.sizeOf(context).height * .09,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: const Center(
                      child: Text(
                        'الانتقال الي العلامة',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                width: MediaQuery.sizeOf(context).width * .0075,
                height: MediaQuery.sizeOf(context).height * .09,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => navigateTo(context, const ZekrView()),
                  child: ContainerBottomEdge(
                    height: MediaQuery.sizeOf(context).height * .09,
                    child: const Text(
                      'الــذكــر',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                width: MediaQuery.sizeOf(context).width * .0075,
                height: MediaQuery.sizeOf(context).height * .09,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => cubit.addPageSign(),
                  child: ContainerBottomEdge(
                    height: MediaQuery.sizeOf(context).height * .09,
                    child: const Center(
                      child: Text(
                        'اضافة علامة',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
              height: 0,
              thickness: MediaQuery.sizeOf(context).width * .0075,
              color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => themeCubit.changeMode(),
                    child: ContainerBottomEdge(
                      width: MediaQuery.sizeOf(context).width * .14,
                      height: MediaQuery.sizeOf(context).height * .11,
                      child: Icon(
                          themeCubit.darkTheme
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode,
                          size: 30,
                          color: Colors.white),
                    ),
                  );
                },
              ),
              const CustomDivider(),
              GestureDetector(
                onTap: () => navigateTo(context, const Fehres()),
                child: ContainerBottomEdge(
                  width: MediaQuery.sizeOf(context).width * .23,
                  height: MediaQuery.sizeOf(context).height * .11,
                  child: const Text(
                    'السور',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              const CustomDivider(),
              GestureDetector(
                onTap: () => navigateTo(context, const Agzaa()),
                child: ContainerBottomEdge(
                  width: MediaQuery.sizeOf(context).width * .23,
                  height: MediaQuery.sizeOf(context).height * .11,
                  child: const Text(
                    'الأجزاء',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              const CustomDivider(),
              GestureDetector(
                onTap: () {
                  if (!Platform.isWindows) {
                    cubit.showEdgesFn();
                    navigateTo(context, const TafsirView());
                  }
                },
                child: ContainerBottomEdge(
                  width: MediaQuery.sizeOf(context).width * .23,
                  height: MediaQuery.sizeOf(context).height * .11,
                  child: const Text(
                    'التفسير',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              const CustomDivider(),
              GestureDetector(
                onTap: () {
                  navigateTo(context, const SearchView());
                },
                child: ContainerBottomEdge(
                  width: MediaQuery.sizeOf(context).width * .14,
                  height: MediaQuery.sizeOf(context).height * .11,
                  child:
                      const Icon(Icons.search, size: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

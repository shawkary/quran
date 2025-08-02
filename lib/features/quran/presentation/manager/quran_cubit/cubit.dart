import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/components.dart';
import '../../../../../core/utiles/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitialState());

  void showEdgesFn() {
    showEdges = !showEdges;
    emit(showEdges? QuranShowEdgesState() : QuranCloseEdgesState());
  }

  void changePages() {
    getGozName();
    getSauraName();
    cacheData();
    emit(changePage? QuranChangePages1State() : QuranChangePages2State());
  }

  void cacheImages(BuildContext context, int value) {
    precacheImage(
        AssetImage('assets/images/quran_images/${value + 1}.jpg'), context);
    if (value > 0 && value < 603) {
      precacheImage(
          AssetImage('assets/images/quran_images/$value.jpg'), context);
      precacheImage(
          AssetImage('assets/images/quran_images/${value + 2}.jpg'), context);
    }
  }

  void addPageSign() {
    signedPage = pageNum!;
    SharedPref.saveInt('signedPage', signedPage);
    emit(AddPageSignState());
  }
}

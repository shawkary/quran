import 'dart:async';

import '../../../../core/utiles/components.dart';
import '../../../../core/utiles/list_ayat.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Timer? _timer;

  void onSearchChanged(String value) {
    if (_timer?.isActive ?? false) _timer!.cancel();
    _timer = Timer(const Duration(milliseconds: 400), () {
      searchForAya(value);
      textFormIsEmpty(value);
    });
  }

  void searchForAya(String value) {
    pageCounter = 0;
    pages = [];
    searchedAyat = [];
    sauraNames = [];
    agzaaNames = [];
    ayat = [];
    emit(AyatLoadingState());
    for (int i = 0; i < ayatList.length; i++) {
      for (int j = 0; j < ayatList[i].length; j++) {
        if (pagesEdit(i, j)) pageCounter = pageCounter - 1;
        pageCounter++;
        for (int k = 0; k < ayatList[i][j].length; k++) {
          ayatCounter++;
          if (ayatList[i][j][k].contains(value)) {
            searchedAyat.add(ayatList[i][j][k]);
            sauraNames.add(sauraPage.keys.toList()[i]);
            agzaaNames.add(agzaaNamesFn(pageCounter + 1));
            ayat.add(ayatCounter);
            pages.add(pageCounter);
          }
        }
      }
      ayatCounter = 0;
    }
    if (value.isEmpty) searchedAyat = [];
    emit(AyatAddingState());
  }

  String agzaaNamesFn(int index) {
    for (int i = 0; i < 30; i++) {
      if (index >= alAgzaaPages.values.toList()[i]) {
        gozName = alAgzaaPages.keys.toList()[i];
      }
    }
    return gozName;
  }

  void textFormIsEmpty(String value) {
    if (value.isEmpty || value.length == 1) {
      emit(TextFormEmptyState());
    }
  }

  bool pagesEdit(int i, int j) {
    if ((i == 4 ||
            i == 10 ||
            i == 11 ||
            i == 13 ||
            i == 15 ||
            i == 17 ||
            i == 19 ||
            i == 24 ||
            i == 27 ||
            i == 28 ||
            i == 29 ||
            i == 34 ||
            i == 35 ||
            i == 38 ||
            i == 39 ||
            i == 42 ||
            i == 45 ||
            i == 48 ||
            i == 50 ||
            i == 51 ||
            i == 53 ||
            i == 54 ||
            i == 55 ||
            i == 56 ||
            i == 58 ||
            i == 60 ||
            i == 62 ||
            i == 67 ||
            i == 68 ||
            i == 69 ||
            i == 70 ||
            i == 73 ||
            i == 74 ||
            i == 75 ||
            i == 76 ||
            i == 78 ||
            i == 82 ||
            i == 83 ||
            i == 86 ||
            i == 87 ||
            i == 89 ||
            i == 91 ||
            i == 92 ||
            i == 93 ||
            i == 95 ||
            i == 97 ||
            i == 98 ||
            i == 99 ||
            i == 100 ||
            i == 101 ||
            i == 103 ||
            i == 104 ||
            i == 106 ||
            i == 107 ||
            i == 109 ||
            i == 110 ||
            i == 112 ||
            i == 113) &&
        j == 0) {
      return true;
    } else {
      return false;
    }
  }

  final FocusNode focusNode = FocusNode();
  void focusNodeFun(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Future<void> close() {
    focusNode.dispose();
    searchedAyat = [];
    return super.close();
  }
}

import 'dart:io';
import '../manager/quran_cubit/cubit.dart';
import 'widgets/quran_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
        statusBarIconBrightness: Theme.of(context)
            .appBarTheme
            .systemOverlayStyle!
            .statusBarIconBrightness));
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return BlocProvider(
      create: (context) => QuranCubit(),
      child: Padding(
        padding: Platform.isWindows
            ? EdgeInsets.zero
            : EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Scaffold(
            backgroundColor: Theme.of(context).focusColor,
            body: const QuranViewBody()),
      ),
    );
  }
}

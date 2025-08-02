import '../cubit/search_cubit.dart';
import 'widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit()..focusNodeFun(context),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withValues(alpha: 0),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarIconBrightness: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle!
                  .statusBarIconBrightness),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}

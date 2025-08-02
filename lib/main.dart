import 'core/custom/app_themes.dart';
import 'core/utiles/components.dart';
import 'core/utiles/shared_pref.dart';
import 'features/quran/presentation/manager/theme_cubit/theme_cubit.dart';
import 'features/quran/presentation/view/quran_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer = MyBlocObserver();

  pageNum = await SharedPref.getInt('cachedPage') ?? 1;
  signedPage = await SharedPref.getInt('signedPage') ?? 1;
  sauraName = await SharedPref.getString('sauraName') ?? 'الفاتحة';
  gozName = await SharedPref.getString('gozName') ?? 'الجزء الأول';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeCubit = context.read<ThemeCubit>();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightMode(),
            darkTheme: AppThemes.darkMode(),
            themeMode: themeCubit.darkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const QuranView(),
          );
        },
      ),
    );
  }
}

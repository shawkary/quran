import 'package:azkar/core/utiles/components.dart';
import 'package:azkar/core/utiles/shared_pref.dart';
import 'package:azkar/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:azkar/features/quran/presentation/view/quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  pageNum = await SharedPref.getInt('cachedPage') ?? 1;
  isDark = await SharedPref.getBool('isDark') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuranCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Quran(),
      ),
    );
  }
}

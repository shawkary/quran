import '../../../../../core/utiles/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : darkTheme = SharedPref.getBool('isDark') ?? true,
        super(ThemeInitialState());

  bool darkTheme = false;

  void changeMode() {
    darkTheme = !darkTheme;
    SharedPref.saveBool('isDark', darkTheme);
    emit(darkTheme ? DarkModeState() : LightModeState());
  }
}

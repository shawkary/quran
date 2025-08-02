part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitialState extends ThemeState {}

final class LightModeState extends ThemeState {}
final class DarkModeState extends ThemeState {}

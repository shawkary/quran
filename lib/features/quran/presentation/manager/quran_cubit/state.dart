part of 'cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitialState extends QuranState {}

final class QuranShowEdgesState extends QuranState {}

final class QuranCloseEdgesState extends QuranState {}

final class QuranDarkModeState extends QuranState {}

final class QuranLightModeState extends QuranState {}

final class QuranChangePages1State extends QuranState {}

final class QuranChangePages2State extends QuranState {}

final class AddPageSignState extends QuranState {}

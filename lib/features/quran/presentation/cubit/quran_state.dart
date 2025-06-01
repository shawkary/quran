part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitialState extends QuranState {}

final class AyatLoadingState extends QuranState {}

final class AyatAddingState extends QuranState {}
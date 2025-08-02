part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

final class AyatLoadingState extends SearchState {}

final class AyatAddingState extends SearchState {}

final class TextFormEmptyState extends SearchState {}

import 'package:movies_app/data/models/movie.dart';

sealed class SearchState {}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  List<Movie> list;

  SearchSuccessState({required this.list});
}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {}

import 'package:movies_app/data/models/popular_movie.dart';

sealed class HomeViewModelState {}

class GetPopularMoviesInitialState extends HomeViewModelState {}

class GetPopularMoviesLoadingState extends HomeViewModelState {}

class GetPopularMoviesSuccessState extends HomeViewModelState {
  List<PopularMovie>list;
  GetPopularMoviesSuccessState({required this.list});
}

class GetPopularMoviesErrorState extends HomeViewModelState {
  Exception exception ;
  GetPopularMoviesErrorState({required this.exception});
}

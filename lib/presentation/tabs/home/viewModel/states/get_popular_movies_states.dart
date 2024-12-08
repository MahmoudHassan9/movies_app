import '../../../../../data/models/popular_movie_response/popular_movie.dart';

sealed class GetPopularMoviesState{}

class GetPopularMoviesInitialState extends GetPopularMoviesState {}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {}

class GetPopularMoviesSuccessState extends GetPopularMoviesState {
  List<PopularMovie> list;

  GetPopularMoviesSuccessState({required this.list});
}

class GetPopularMoviesErrorState extends GetPopularMoviesState {
  Exception exception;

  GetPopularMoviesErrorState({required this.exception});
}


import '../../../../../data/models/movie.dart';

sealed class GetPopularMoviesState{}

class GetPopularMoviesInitialState extends GetPopularMoviesState {}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {}

class GetPopularMoviesSuccessState extends GetPopularMoviesState {
  List<Movie> list;

  GetPopularMoviesSuccessState({required this.list});
}

class GetPopularMoviesErrorState extends GetPopularMoviesState {
  Exception exception;

  GetPopularMoviesErrorState({required this.exception});
}

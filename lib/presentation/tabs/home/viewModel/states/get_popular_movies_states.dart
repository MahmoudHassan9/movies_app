
import 'package:movies_app/domain/entity/movie_entity.dart';


sealed class GetPopularMoviesState{}

class GetPopularMoviesInitialState extends GetPopularMoviesState {}

class GetPopularMoviesLoadingState extends GetPopularMoviesState {}

class GetPopularMoviesSuccessState extends GetPopularMoviesState {
  List<MovieEntity> list;

  GetPopularMoviesSuccessState({required this.list});
}

class GetPopularMoviesErrorState extends GetPopularMoviesState {
  Exception exception;

  GetPopularMoviesErrorState({required this.exception});
}


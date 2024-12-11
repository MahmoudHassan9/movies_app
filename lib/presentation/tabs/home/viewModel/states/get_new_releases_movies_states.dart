
import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../../../../data/models/movie.dart';

sealed class GetNewReleasesMoviesState {}

class GetNewReleasesMoviesInitialState extends GetNewReleasesMoviesState {}

class GetNewReleasesMoviesLoadingState extends GetNewReleasesMoviesState {}

class GetNewReleasesMoviesSuccessState extends GetNewReleasesMoviesState {
  List<MovieEntity> list;

  GetNewReleasesMoviesSuccessState({required this.list});
}

class GetNewReleasesMoviesErrorState extends GetNewReleasesMoviesState {
  Exception exception;

  GetNewReleasesMoviesErrorState({required this.exception});
}

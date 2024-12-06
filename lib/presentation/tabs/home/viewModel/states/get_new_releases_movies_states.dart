import '../../../../../data/models/new_release_movie_response/new_releases_movie.dart';

sealed class GetNewReleasesMoviesState {}

class GetNewReleasesMoviesInitialState extends GetNewReleasesMoviesState {}

class GetNewReleasesMoviesLoadingState extends GetNewReleasesMoviesState {}

class GetNewReleasesMoviesSuccessState extends GetNewReleasesMoviesState {
  List<NewReleaseMovie> list;

  GetNewReleasesMoviesSuccessState({required this.list});
}

class GetNewReleasesMoviesErrorState extends GetNewReleasesMoviesState {
  Exception exception;

  GetNewReleasesMoviesErrorState({required this.exception});
}

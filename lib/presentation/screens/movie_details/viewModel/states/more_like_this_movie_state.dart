import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../../../../data/models/movie.dart';

sealed class MoreLikeThisMovieState {}

class GetMoreLikeThisMovieInitialState extends MoreLikeThisMovieState {}

class GetMoreLikeThisMovieLoadingState extends MoreLikeThisMovieState {}

class GetMoreLikeThisMovieSuccessState extends MoreLikeThisMovieState {
  List<MovieEntity> list;

  GetMoreLikeThisMovieSuccessState({required this.list});
}

class GetMoreLikeThisMovieErrorState extends MoreLikeThisMovieState {
  Exception exception;

  GetMoreLikeThisMovieErrorState({required this.exception});
}

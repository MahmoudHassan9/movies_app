import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie.dart';

import '../../../../../domain/usecases/get_more_like_this_movies_use_case.dart';
import '../../../../../result.dart';

import '../states/more_like_this_movie_state.dart';

class MoreLikeThisMoviesCubit extends Cubit<MoreLikeThisMovieState> {
  MoreLikeThisMoviesCubit({required this.getMoreLikeThisMoviesUseCase})
      : super(GetMoreLikeThisMovieInitialState());
  GetMoreLikeThisMoviesUseCase getMoreLikeThisMoviesUseCase;

  void getMoreLikeThisMovies(String id) async {
    emit(GetMoreLikeThisMovieLoadingState());
    var result = await getMoreLikeThisMoviesUseCase.execute(id);
    switch (result) {
      case Success<List<Movie>>():
        emit(GetMoreLikeThisMovieSuccessState(list: result.data));
      case Error<List<Movie>>():
        emit(GetMoreLikeThisMovieErrorState(exception: result.exception));
    }
  }
}

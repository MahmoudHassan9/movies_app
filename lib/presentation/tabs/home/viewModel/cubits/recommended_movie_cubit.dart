import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movies_app/result.dart';

import '../../../../../data/models/movie.dart';
import '../states/recommended_movie_state.dart';

class RecommendedMovieCubit extends Cubit<RecommendedMovieState> {
  RecommendedMovieCubit({required this.useCase})
      : super(GetRecommendedMovieInitialState());
  GetRecommendedMoviesUseCase useCase;

  void getRecommendedMovies() async {
    emit(GetRecommendedMovieLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<Movie>>():
        emit(GetRecommendedMovieSuccessState(list: result.data));
      case Error<List<Movie>>():
        emit(GetRecommendedMovieErrorState(exception: result.exception));
    }
  }
}

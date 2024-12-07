import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';
import 'package:movies_app/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movies_app/result.dart';

import '../states/recommended_movie_state.dart';

class RecommendedMovieCubit extends Cubit<RecommendedMovieState> {
  RecommendedMovieCubit({required this.useCase})
      : super(GetRecommendedMovieInitialState());
  GetRecommendedMoviesUseCase useCase;

  void getRecommendedMovies() async {
    emit(GetRecommendedMovieLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<RecommendedMovie>>():
        emit(GetRecommendedMovieSuccessState(list: result.data));
      case Error<List<RecommendedMovie>>():
        emit(GetRecommendedMovieErrorState(exception: result.exception));
    }
  }
}

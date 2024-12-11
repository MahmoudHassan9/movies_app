import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movies_app/result.dart';

import '../../../../../data/models/movie.dart';
import '../states/recommended_movie_state.dart';

@injectable
class RecommendedMovieCubit extends Cubit<RecommendedMovieState> {
  @factoryMethod
  RecommendedMovieCubit({required this.useCase})
      : super(GetRecommendedMovieInitialState());
  GetRecommendedMoviesUseCase useCase;

  void getRecommendedMovies() async {
    emit(GetRecommendedMovieLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<MovieEntity>>():
        emit(GetRecommendedMovieSuccessState(list: result.data));
      case Error<List<MovieEntity>>():
        emit(GetRecommendedMovieErrorState(exception: result.exception));
    }
  }
}

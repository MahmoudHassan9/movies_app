import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/states/get_popular_movies_states.dart';

import '../../../../../data/models/popular_movie_response/popular_movie.dart';
import '../../../../../result.dart';

class PopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  PopularMoviesCubit({required this.getPopularMoviesUseCase})
      : super(GetPopularMoviesInitialState());
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  void getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await getPopularMoviesUseCase.execute();
    switch (result) {
      case Success<List<PopularMovie>>():
        emit(GetPopularMoviesSuccessState(list: result.data));
      case Error<List<PopularMovie>>():
        emit(GetPopularMoviesErrorState(exception: result.exception));
    }
  }
}

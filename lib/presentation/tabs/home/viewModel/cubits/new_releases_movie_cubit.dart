import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/states/get_new_releases_movies_states.dart';

import '../../../../../data/models/new_release_movie_response/new_releases_movie.dart';
import '../../../../../domain/usecases/get_new_releases_movie_use_case.dart';
import '../../../../../result.dart';

class NewReleasesMoviesCubit extends Cubit<GetNewReleasesMoviesState> {
  NewReleasesMoviesCubit({
    required this.getNewReleasesMovieUseCase,
  }) : super(GetNewReleasesMoviesInitialState());

  GetNewReleasesMovieUseCase getNewReleasesMovieUseCase;

  void getNewReleasesMovies() async {
    emit(GetNewReleasesMoviesLoadingState());
    var result = await getNewReleasesMovieUseCase.execute();
    switch (result) {
      case Success<List<NewReleaseMovie>>():
        emit(GetNewReleasesMoviesSuccessState(list: result.data));
      case Error<List<NewReleaseMovie>>():
        emit(GetNewReleasesMoviesErrorState(exception: result.exception));
    }
  }
}

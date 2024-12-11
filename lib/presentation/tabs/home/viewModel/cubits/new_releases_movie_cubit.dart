import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/states/get_new_releases_movies_states.dart';

import '../../../../../data/models/movie.dart';
import '../../../../../domain/usecases/get_new_releases_movie_use_case.dart';
import '../../../../../result.dart';

@injectable
class NewReleasesMoviesCubit extends Cubit<GetNewReleasesMoviesState> {
  @factoryMethod
  NewReleasesMoviesCubit({
    required this.getNewReleasesMovieUseCase,
  }) : super(GetNewReleasesMoviesInitialState());

  GetNewReleasesMovieUseCase getNewReleasesMovieUseCase;

  void getNewReleasesMovies() async {
    emit(GetNewReleasesMoviesLoadingState());
    var result = await getNewReleasesMovieUseCase.execute();
    switch (result) {
      case Success<List<MovieEntity>>():
        emit(GetNewReleasesMoviesSuccessState(list: result.data));
      case Error<List<MovieEntity>>():
        emit(GetNewReleasesMoviesErrorState(exception: result.exception));
    }
  }
}

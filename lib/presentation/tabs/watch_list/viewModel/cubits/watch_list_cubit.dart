import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/states/watch_list_state.dart';

import '../../../../../data/models/movie.dart';
import '../../../../../domain/usecases/watch_list_movies_use_case.dart';
import '../../../../../result.dart';

@injectable
class WatchListCubit extends Cubit<WatchListState> {
  @factoryMethod
  WatchListCubit({required this.watchListMoviesUseCase})
      : super(GetWatchListInitialState());
  WatchListMoviesUseCase watchListMoviesUseCase;
  List<MovieEntity> movies = [];
  List<int> ids = [];

  void getWatchList() async {
    emit(GetWatchListLoadingState());
    var result = await watchListMoviesUseCase.getWatchListMovies();
    switch (result) {
      case Success<List<MovieEntity>>():
        {
          movies = result.data;
          if (movies.isNotEmpty) {
            emit(GetWatchListISuccessState());
          } else {
            emit(GetWatchListInitialState());
          }
        }
      case Error<List<MovieEntity>>():
        emit(GetWatchListIErrorState());
    }
  }

  void updateWatchList(MovieEntity movie) async {
    if (ids.contains(movie.id) || movies.contains(movie)) return;
    var result = await watchListMoviesUseCase.addToWatchListMovies(movie);
    switch (result) {
      case Success<bool>():
        {
          getWatchList();
          // log('Success');
        }
      case Error<bool>():
      // log('Error');
    }
  }
}

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/states/watch_list_state.dart';

import '../../../../../data/models/movie.dart';
import '../../../../../domain/usecases/watch_list_movies_use_case.dart';
import '../../../../../result.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit({required this.watchListMoviesUseCase})
      : super(GetWatchListInitialState());
  WatchListMoviesUseCase watchListMoviesUseCase;
  List<Movie> movies = [];
  List<int> ids = [];

  void getWatchList() async {
    emit(GetWatchListLoadingState());
    var result = await watchListMoviesUseCase.getWatchListMovies();
    switch (result) {
      case Success<List<Movie>>():
        {
          movies = result.data;
          if (movies.isNotEmpty)
            emit(GetWatchListISuccessState());
          else
            emit(GetWatchListInitialState());
        }
      case Error<List<Movie>>():
        emit(GetWatchListIErrorState());
    }
  }

  void updateWatchList(Movie movie) async {
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

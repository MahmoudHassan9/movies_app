import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/home_view_model_states.dart';
import 'package:movies_app/result.dart';

class HomeViewModel extends Cubit<HomeViewModelState> {
  HomeViewModel({required this.useCase}) : super(GetPopularMoviesInitialState());
  GetPopularMoviesUseCase useCase;

  void getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<PopularMovie>>():
        emit(GetPopularMoviesSuccessState(list: result.data));
      case Error<List<PopularMovie>>():
        emit(GetPopularMoviesErrorState(exception: result.exception));
    }
  }
}

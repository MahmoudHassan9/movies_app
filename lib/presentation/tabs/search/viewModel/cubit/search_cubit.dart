import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/domain/usecases/search_use_case.dart';
import 'package:movies_app/presentation/tabs/search/viewModel/state/search_state.dart';
import 'package:movies_app/result.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  @factoryMethod
  SearchCubit({required this.useCase}) : super(SearchInitialState());
  SearchUseCase useCase;

  void search(String query) async {
    emit(SearchLoadingState());
    var result = await useCase.execute(query);
    switch (result) {
      case Success<List<Movie>>():
        emit(SearchSuccessState(list: result.data));
      case Error<List<Movie>>():
        emit(SearchErrorState());
    }
  }
}

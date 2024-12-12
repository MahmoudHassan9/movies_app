import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/domain/usecases/categories_movies_use_case.dart';
import 'package:movies_app/presentation/tabs/browse/viewModel/state/browse_state.dart';
import 'package:movies_app/result.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  @factoryMethod
  BrowseCubit({required this.useCase}) : super(BrowseInitialState());
  CategoriesUseCase useCase;

  void getCategories() async {
    emit(BrowseLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<Category>>():
        emit(BrowseSuccessState(list: result.data));
      case Error<List<Category>>():
        emit(BrowseErrorState());
    }
  }
}

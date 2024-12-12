import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/domain/usecases/moveis_based_on_category_use_case.dart';
import 'package:movies_app/presentation/screens/category_details/viewModel/state/category_details_state.dart';
import 'package:movies_app/result.dart';

@injectable
class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  @factoryMethod
  CategoryDetailsCubit({required this.useCase})
      : super(CategoryDetailsInitialState());
  MoviesBasedOnCategoryUseCase useCase;

  void getMoviesBasedOnCategoryId(String categoryId) async {
    emit(CategoryDetailsLoadingState());
    var result = await useCase.execute(categoryId);
    switch (result) {
      case Success<List<Movie>>():
        emit(CategoryDetailsSuccessState(list: result.data));
      case Error<List<Movie>>():
        emit(CategoryDetailsErrorState());
    }
  }
}

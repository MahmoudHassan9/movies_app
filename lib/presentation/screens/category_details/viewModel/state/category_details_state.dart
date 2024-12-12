import '../../../../../data/models/movie.dart';

sealed class CategoryDetailsState {}

class CategoryDetailsInitialState extends CategoryDetailsState {}

class CategoryDetailsLoadingState extends CategoryDetailsState {}

class CategoryDetailsSuccessState extends CategoryDetailsState {
  List<Movie> list;

  CategoryDetailsSuccessState({required this.list});
}

class CategoryDetailsErrorState extends CategoryDetailsState {}

import '../../../../../data/models/movie_categories/Genres.dart';

sealed class BrowseState {}

class BrowseInitialState extends BrowseState {}

class BrowseLoadingState extends BrowseState {}
class BrowseErrorState extends BrowseState {}

class BrowseSuccessState extends BrowseState {
  List<Category> list;

  BrowseSuccessState({required this.list});
}

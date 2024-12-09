import '../../../../../data/models/movie.dart';

sealed class WatchListState {}

class GetWatchListInitialState extends WatchListState {}

class GetWatchListLoadingState extends WatchListState {}

class GetWatchListISuccessState extends WatchListState {
}

class GetWatchListIErrorState extends WatchListState {}




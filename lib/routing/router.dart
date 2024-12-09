import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/firebase_service.dart';
import 'package:movies_app/data/data_source_impl/watch_list_movies_data_source_impl.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/repo_impl/watch_list_repo_impl.dart';
import 'package:movies_app/domain/usecases/watch_list_movies_use_case.dart';
import 'package:movies_app/presentation/screens/home_screen/home_screen.dart';
import 'package:movies_app/presentation/screens/movie_details/view/movie_details_screen.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/cubits/watch_list_cubit.dart';

import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/presentation/screens/home_screen/home_screen.dart';
import 'package:movies_app/presentation/screens/movie_details/view/movie_details_screen.dart';

import 'package:movies_app/routing/routes.dart';

abstract class AppRouter {
  static Route? router(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => WatchListCubit(
              watchListMoviesUseCase: WatchListMoviesUseCase(
                watchListMoviesRepo: WatchListMoviesRepoImpl(
                  watchListMoviesDataSource: WatchListMoviesDataSourceImpl(
                    firebaseService: FirebaseService(),
                  ),
                ),
              ),
            )..getWatchList(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.movieDetails:
        {
          var movie = routeSettings.arguments as Movie;
          return MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movie: movie,
            ),
          );
        }
    }
    return null;
  }
}

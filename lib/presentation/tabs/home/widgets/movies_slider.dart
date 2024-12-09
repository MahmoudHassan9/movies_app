import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/api/firebase_service.dart';
import 'package:movies_app/data/data_source_impl/popular_movies_api_data_source.dart';
import 'package:movies_app/data/data_source_impl/watch_list_movies_data_source_impl.dart';
import 'package:movies_app/data/repo_impl/popular_movies_repo_impl.dart';
import 'package:movies_app/data/repo_impl/watch_list_repo_impl.dart';
import 'package:movies_app/domain/repo_contract/popular_movies_repo.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/domain/usecases/watch_list_movies_use_case.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/cubits/popular_movies_cubit.dart';
import 'package:movies_app/routing/routes.dart';

import '../../../../data/models/movie.dart';
import '../viewModel/states/get_popular_movies_states.dart';
import 'movies_slider_image.dart';

class MoviesSlider extends StatefulWidget {
  const MoviesSlider({super.key});

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PopularMoviesCubit(
        getPopularMoviesUseCase: GetPopularMoviesUseCase(
          repo: PopularMoviesRepoImpl(
            dataSource: PopularMoviesApiDataSourceImpl(
              apiManager: ApiManager(),
            ),
          ),
        ),
      )..getPopularMovies(),
      child: BlocBuilder<PopularMoviesCubit, GetPopularMoviesState>(
        builder: (BuildContext context, GetPopularMoviesState state) {
          switch (state) {
            case GetPopularMoviesLoadingState():
              return SizedBox(
                height: 289.h,
                child: const LoadingWidget(),
              );
            case GetPopularMoviesSuccessState():
              {
                var images = state.list
                    .map(
                      (movie) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.movieDetails,
                            arguments: movie,
                          );
                        },
                        child: MoviesImageSlider(

                          movie: Movie(
                            id: movie.id,
                            isWatchList: false,
                            title: movie.title,
                            backdropPath: movie.backdropPath,
                            overview: movie.overview,
                            releaseDate: movie.releaseDate,
                            posterPath: movie.posterPath,
                            popularity: movie.popularity,
                            adult: movie.adult,
                            genreIds: movie.genreIds,
                            originalLanguage: movie.originalLanguage,
                            originalTitle: movie.originalTitle,
                            video: movie.video,
                            voteAverage: movie.voteAverage,
                            voteCount: movie.voteCount,
                          ),

                          movie: movie,

                        ),
                      ),
                    )
                    .toList();
                return slider(images: images);
              }
            case GetPopularMoviesErrorState():
              return const Text('Error');
            case GetPopularMoviesInitialState():
              return const SizedBox();
          }
        },
      ),
    );
  }

//
  Widget slider({required images}) => CarouselSlider(
        items: images,
        options: CarouselOptions(
          height: 289.h,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      );
}

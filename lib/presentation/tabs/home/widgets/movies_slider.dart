import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/home_view_model.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/home_view_model_states.dart';

import 'movies_slider_image.dart';

class MoviesSlider extends StatefulWidget {
  const MoviesSlider({super.key});

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeViewModelState>(
      builder: (BuildContext context, HomeViewModelState state) {
        if (state is GetPopularMoviesLoadingState ||
            state is GetPopularMoviesInitialState) {
          return const LoadingWidget();
        } else if (state is GetPopularMoviesErrorState) {
          return const Text('Error');
        } else if (state is GetPopularMoviesSuccessState) {
          String base = 'https://image.tmdb.org/t/p/original';
          List<PopularMovie> movies = state.list;
          var images = movies
              .map(
                (movie) => MoviesSliderImage(
                  bgPath: base + movie.backdropPath!,
                  posterPath: base + movie.posterPath!,
                ),
              )
              .toList();
          return CarouselSlider(
            items: images,
            options: CarouselOptions(
              height: 289.h,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return Container();
      },
    );
  }
}

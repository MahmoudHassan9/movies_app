import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        switch (state) {
          case GetPopularMoviesInitialState():
          case GetPopularMoviesLoadingState():
            return SizedBox(
              height: 289.h,
              child: const LoadingWidget(),
            );
          case GetPopularMoviesSuccessState():
            {
              var images = state.list
                  .map(
                    (movie) => MoviesImageSlider(
                      movie: movie,
                    ),
                  )
                  .toList();
              return slider(images: images);
            }
          case GetPopularMoviesErrorState():
            return const Text('Error');
        }
      },
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
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      );
}

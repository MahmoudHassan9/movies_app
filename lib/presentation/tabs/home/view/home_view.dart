import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_impl/popular_movies_api_data_source.dart';
import 'package:movies_app/data/repo_impl/popular_movies_repo_impl.dart';
import 'package:movies_app/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/home_view_model.dart';
import 'package:movies_app/presentation/tabs/home/widgets/movies_slider_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> images = [
    const MoviesSliderImage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeViewModel(
        useCase: GetPopularMoviesUseCase(
          repo: PopularMoviesRepoImpl(
            dataSource: PopularMoviesApiDataSourceImpl(
              apiManager: ApiManager(),
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          moviesSlider(),
        ],
      ),
    );
  }

  Widget moviesSlider() => CarouselSlider(
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_impl/more_like_this_movies_api_data_source_impl.dart';
import 'package:movies_app/data/repo_impl/more_like_this_repo_impl.dart';
import 'package:movies_app/domain/usecases/get_more_like_this_movies_use_case.dart';
import 'package:movies_app/presentation/screens/movie_details/viewModel/cubit/more_like_this_movies_cubit.dart';
import 'package:movies_app/presentation/screens/movie_details/viewModel/states/more_like_this_movie_state.dart';
import 'package:movies_app/routing/routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../data/models/movie.dart';
import '../../../common/loading_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? '',
          style: AppStyles.movieDetailsTitle,
        ),
      ),
      body: Column(
        children: [
          imageBackGroundAndTitle(),
          posterRow(),
          moreLikeThisList(),
        ],
      ),
    );
  }

  Widget imageBackGroundAndTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                height: 217.h,
                imageUrl: movie.backdropPath == null
                    ? AppConstants.errorImaga
                    : AppConstants.imageBase + movie.backdropPath!,
                imageBuilder: (context, imageProvider) => Container(
                  // height: 217.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
              ImageIcon(
                const AssetImage(
                  AppAssets.playButtonIcon,
                ),
                color: Colors.white,
                size: 60.sp,
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? '',
                  style: AppStyles.movieDetailsTitle,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  movie.releaseDate ?? '',
                  style: AppStyles.popularMovieDesc,
                ),
              ],
            ),
          ),
        ],
      );

  Widget posterRow() => Padding(
        padding: REdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: SizedBox(
          height: 200.h,
          child: Row(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    height: 199.h,
                    width: 129.w,
                    imageUrl: movie.posterPath == null
                        ? AppConstants.errorImaga
                        : AppConstants.imageBase + movie.posterPath!,
                    imageBuilder: (context, imageProvider) => Container(
                      // height: 199.h,
                      // width: 129.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const LoadingWidget(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  ),
                  Positioned(
                    left: -5.5.w,
                    top: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const ImageIcon(
                          size: 40,
                          color: Color(0xFF514F4F),
                          AssetImage(
                            AppAssets.bookMarkIcon,
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(bottom: 6),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 9,
                              runSpacing: 3,
                              direction: Axis.horizontal,
                              children: [
                                movieTypeContainer(text: 'Action'),
                                movieTypeContainer(text: 'Action'),
                                movieTypeContainer(text: 'Action'),
                                movieTypeContainer(text: 'Action'),
                              ],
                            ),
                            SizedBox(
                              height: 13.h,
                            ),
                            Text(
                              movie.overview ?? '',
                              style: AppStyles.overview,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: AppStyles.rateText.copyWith(fontSize: 18.sp),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget movieTypeContainer({required String text}) => Container(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF514F4F),
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          text,
          style: AppStyles.popularMovieDesc,
        ),
      );

  Widget moreLikeThisList() => BlocProvider(
        create: (context) => MoreLikeThisMoviesCubit(
          getMoreLikeThisMoviesUseCase: GetMoreLikeThisMoviesUseCase(
            repo: MoreLikeThisMoviesRepoImpl(
              moreLikeThisMoviesDataSource: MoreLikeThisMoviesApiDataSourceImpl(
                apiManager: ApiManager(),
              ),
            ),
          ),
        )..getMoreLikeThisMovies(movie.id.toString()),
        child: BlocBuilder<MoreLikeThisMoviesCubit, MoreLikeThisMovieState>(
          builder: (BuildContext context, MoreLikeThisMovieState state) {
            switch (state) {
              case GetMoreLikeThisMovieInitialState():
                return const SizedBox();
              case GetMoreLikeThisMovieLoadingState():
                return SizedBox(
                  height: 187.h,
                  child: const LoadingWidget(),
                );
              case GetMoreLikeThisMovieSuccessState():
                return Container(
                  height: 250.h,
                  padding: REdgeInsets.only(
                    top: 15,
                    bottom: 0,
                    left: 22,
                  ),
                  color: AppColors.grayAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'More Like This',
                        style: AppStyles.homeListTitle,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.movieDetails,
                                arguments: state.list[index],
                              );
                            },
                            child: moreLikeThisListItem(
                              movie: state.list[index],
                            ),
                          ),
                          itemCount: state.list.length,
                          separatorBuilder: (context, index) => SizedBox(
                            width: 14.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case GetMoreLikeThisMovieErrorState():
                return const Text('Error');
            }
          },
        ),
      );

  Widget moreLikeThisListItem({required Movie movie}) => Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                height: 128.h,
                width: 97.w,
                imageUrl: movie.posterPath == null
                    ? AppConstants.errorImaga
                    : AppConstants.imageBase + movie.posterPath!,
                imageBuilder: (context, imageProvider) => Container(
                  // height: 128.h,
                  // width: 97.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const LoadingWidget(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
              Positioned(
                top: 0,
                left: -5.5.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const ImageIcon(
                      size: 40,
                      color: Color(0xFF514F4F),
                      AssetImage(
                        AppAssets.bookMarkIcon,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(bottom: 6),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 97.w,
            padding: REdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      movie.voteAverage.toString(),
                      style: AppStyles.rateText,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  movie.title!,
                  style: AppStyles.rateText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  movie.releaseDate!,
                  style: AppStyles.rateText,
                ),
              ],
            ),
          ),
        ],
      );
}

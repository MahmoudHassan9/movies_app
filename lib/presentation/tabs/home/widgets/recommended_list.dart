import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/data_source_impl/recommended_movies_api_data_source_impl.dart';
import 'package:movies_app/data/repo_impl/recommended_movies_repo_impl.dart';
import 'package:movies_app/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/cubits/recommended_movie_cubit.dart';
import 'package:movies_app/routing/routes.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/models/movie.dart';
import '../../watch_list/viewModel/cubits/watch_list_cubit.dart';
import '../viewModel/states/recommended_movie_state.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedMovieCubit(
        useCase: GetRecommendedMoviesUseCase(
          repo: RecommendedMoviesRepoImpl(
            recommendedMoviesDataSource: RecommendedMoviesApiDataSourceImpl(
              apiManager: ApiManager(),
            ),
          ),
        ),
      )..getRecommendedMovies(),
      child: BlocBuilder<RecommendedMovieCubit, RecommendedMovieState>(
        builder: (context, state) {
          switch (state) {
            case GetRecommendedMovieInitialState():
              return const SizedBox();
            case GetRecommendedMovieLoadingState():
              return SizedBox(height: 187.h, child: const LoadingWidget());
            case GetRecommendedMovieSuccessState():
              return recommendedList(state);
            case GetRecommendedMovieErrorState():
              return Text('Error');
          }
        },
      ),
    );
  }

  Widget recommendedList(GetRecommendedMovieSuccessState state) {
    return Container(
      height: 265.h,
      padding: REdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 20,
      ),
      color: AppColors.gray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Recommended',
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
                    Navigator.pushNamed(
                      context,
                      AppRoutes.movieDetails,
                      arguments: state.list[index],
                    );
                  },
                  child: RecommendedListItem(
                    movie: Movie.copyWith(
                      state.list[index],
                    ),
                  )),
              itemCount: state.list.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 14.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedListItem extends StatefulWidget {
  const RecommendedListItem({super.key, required this.movie});

  final Movie movie;

  @override
  State<RecommendedListItem> createState() => _RecommendedListItemState();
}

class _RecommendedListItemState extends State<RecommendedListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              height: 128.h,
              width: 97.w,
              imageUrl: widget.movie.posterPath == null
                  ? AppConstants.errorImaga
                  : AppConstants.imageBase + widget.movie.posterPath!,
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
              child: GestureDetector(
                onTap: () {
                  widget.movie.isWatchList = !widget.movie.isWatchList!;
                  if (widget.movie.isWatchList!) {
                    BlocProvider.of<WatchListCubit>(context)
                        .updateWatchList(widget.movie);

                    BlocProvider.of<WatchListCubit>(context)
                        .ids
                        .add(widget.movie.id);

                    setState(() {});
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageIcon(
                      size: 40,
                      color: widget.movie.isWatchList!
                          ? AppColors.yellow
                          : const Color(0xFF514F4F),
                      const AssetImage(
                        AppAssets.bookMarkIcon,
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(bottom: 6),
                      child: Icon(
                        widget.movie.isWatchList! ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 97.w,
          padding: REdgeInsets.only(top: 6, bottom: 10, left: 6, right: 6),
          decoration: BoxDecoration(
            color: AppColors.grayAccent,
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
                    widget.movie.voteAverage.toString(),
                    style: AppStyles.rateText,
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                widget.movie.title!,
                style: AppStyles.rateText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                widget.movie.releaseDate!,
                style: AppStyles.popularMovieDesc.copyWith(fontSize: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//

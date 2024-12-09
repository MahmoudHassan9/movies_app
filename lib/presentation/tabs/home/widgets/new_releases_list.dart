import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_impl/new_releases_movies_api_data_source_impl.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/repo_impl/new_releases_movie_impl.dart';
import 'package:movies_app/domain/usecases/get_new_releases_movie_use_case.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/cubits/new_releases_movie_cubit.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/states/get_new_releases_movies_states.dart';
import 'package:movies_app/routing/routes.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../watch_list/viewModel/cubits/watch_list_cubit.dart';

bool isWatchList = false;

class NewReleasesList extends StatefulWidget {
  const NewReleasesList({super.key});

  @override
  State<NewReleasesList> createState() => _NewReleasesListState();
}

class _NewReleasesListState extends State<NewReleasesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewReleasesMoviesCubit(
        getNewReleasesMovieUseCase: GetNewReleasesMovieUseCase(
          repo: NewReleaseMovieRepoImpl(
            newReleasesMoviesDataSource: NewReleasesMoviesDataSourceImpl(
              apiManager: ApiManager(),
            ),
          ),
        ),
      )..getNewReleasesMovies(),
      child: BlocBuilder<NewReleasesMoviesCubit, GetNewReleasesMoviesState>(
        builder: (BuildContext context, GetNewReleasesMoviesState state) {
          switch (state) {
            case GetNewReleasesMoviesLoadingState():
              return SizedBox(
                height: 187.h,
                child: const LoadingWidget(),
              );

            case GetNewReleasesMoviesSuccessState():
              return newReleasesList(state);

            case GetNewReleasesMoviesErrorState():
              return const Text('Error');
            case GetNewReleasesMoviesInitialState():
              return const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget newReleasesList(GetNewReleasesMoviesSuccessState state) {
    return Container(
      height: 187.h,
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
            'New Releases',
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
                child: NewReleaseItem(
                  movie: Movie.copyWith(
                    state.list[index],
                  ),
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
  }
}

class NewReleaseItem extends StatefulWidget {
  const NewReleaseItem({super.key, required this.movie});

  final Movie movie;

  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          width: 97.w,
          height: 128.h,
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
              log(widget.movie.isWatchList.toString());
              if (widget.movie.isWatchList!) {
                BlocProvider.of<WatchListCubit>(context)
                    .updateWatchList(widget.movie);
                BlocProvider.of<WatchListCubit>(context)
                    .ids
                    .add(widget.movie.id);
              }
              setState(() {});
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
                    !widget.movie.isWatchList! ? Icons.add : Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/api/firebase_service.dart';
import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/cubits/watch_list_cubit.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/states/watch_list_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../data/models/movie.dart';
import '../../../../routing/routes.dart';
import '../../../common/loading_widget.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

//
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchListState>(
      builder: (BuildContext context, WatchListState state) {
        switch (state) {
          case GetWatchListInitialState():
            return emptyWatchList();
          case GetWatchListLoadingState():
            return const LoadingWidget();
          case GetWatchListISuccessState():
            {
              return Padding(
                padding: REdgeInsets.only(
                  top: 52,
                  left: 22,
                  right: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WatchList',
                      style: AppStyles.movieDetailsTitle,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    watchList(
                      BlocProvider.of<WatchListCubit>(context).movies,
                    ),
                  ],
                ),
              );
            }
          case GetWatchListIErrorState():
            return const Text('Error');
        }
      },
    );
  }

  Widget watchList(list) => Expanded(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.movieDetails,
                arguments: list[index],
              );
            },
            child: watchListItem(
              movie: list[index],
            ),
          ),
          itemCount: list.length,
          separatorBuilder: (context, index) => Divider(
            height: 40.h,
            thickness: 1,
          ),
        ),
      );

  Widget emptyWatchList() => Padding(
        padding: REdgeInsets.only(
          top: 52,
          left: 22,
          right: 22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WatchList',
              style: AppStyles.movieDetailsTitle,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ImageIcon(
                  AssetImage(
                    AppAssets.moviesIcon,
                  ),
                  color: Color(0xFFB5B4B4),
                  size: 80,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'No Movies Yet !',
                  textAlign: TextAlign.center,
                  style: AppStyles.homeListTitle,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      );

  Widget watchListItem({required MovieEntity movie}) => Row(
        children: [
          poster(movie),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? '',
                  style: AppStyles.homeListTitle,
                ),
                Text(
                  movie.releaseDate ?? '',
                  style: AppStyles.popularMovieDesc,
                )
              ],
            ),
          )
        ],
      );

  Widget poster(movie) => Stack(
        children: [
          CachedNetworkImage(
            width: 140.w,
            height: 89.h,
            imageUrl: movie.posterPath == null
                ? AppConstants.errorImaga
                : AppConstants.imageBase + movie.posterPath!,
            imageBuilder: (context, imageProvider) => Container(
              // height: 128.h,
              // width: 97.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                ImageIcon(
                  size: 40,
                  color: movie.isWatchList!
                      ? AppColors.yellow
                      : const Color(0xFF514F4F),
                  const AssetImage(
                    AppAssets.bookMarkIcon,
                  ),
                ),
                Padding(
                  padding: REdgeInsets.only(bottom: 6),
                  child: Icon(
                    movie.isWatchList! ? Icons.check : Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      );
}

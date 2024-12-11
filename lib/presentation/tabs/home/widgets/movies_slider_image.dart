import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/home/viewModel/cubits/popular_movies_cubit.dart';
import 'package:movies_app/presentation/tabs/watch_list/viewModel/cubits/watch_list_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../data/models/movie.dart';

class MoviesImageSlider extends StatefulWidget {
  const MoviesImageSlider({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  State<MoviesImageSlider> createState() => _MoviesImageSliderState();
}

class _MoviesImageSliderState extends State<MoviesImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageBackGround(),
        imagePoster(context),
        imageDetails(),
      ],
    );
  }

  Widget imageBackGround() => Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            height: 217.h,
            imageUrl: widget.movie.backdropPath == null
                ? AppConstants.errorImaga
                : AppConstants.imageBase + widget.movie.backdropPath!,
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
      );

  Widget imagePoster(context) => Positioned(
        bottom: 0.h,
        left: 21.w,
        child: Stack(
          children: [
            CachedNetworkImage(
              height: 199.h,
              width: 129.w,
              imageUrl: widget.movie.posterPath == null
                  ? AppConstants.errorImaga
                  : AppConstants.imageBase + widget.movie.posterPath!,
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
      );

  Widget imageDetails() => Positioned(
        left: 164.w,
        bottom: 10.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie.title ?? '',
              style: AppStyles.popularMovieTitle,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              widget.movie.releaseDate ?? '',
              style: AppStyles.popularMovieDesc,
            ),
          ],
        ),
      );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../data/models/popular_movie_response/popular_movie.dart';

class MoviesImageSlider extends StatelessWidget {
  const MoviesImageSlider({
    super.key,
    required this.movie,
  });

  final PopularMovie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageBackGround(),
        imagePoster(),
        imageDetails(),
      ],
    );
  }

  Widget imageBackGround() => CachedNetworkImage(
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
      );

  Widget imagePoster() => Positioned(
        bottom: 0.h,
        left: 21.w,
        child: Stack(
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
      );

  Widget imageDetails() => Positioned(
        left: 164.w,
        bottom: 10.h,
        child: Column(
          children: [
            Text(
              movie.title ?? '',
              style: AppStyles.popularMovieTitle,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  movie.releaseDate ?? '',
                  style: AppStyles.popularMovieDesc,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  movie.voteCount.toString() ?? '',
                  style: AppStyles.popularMovieDesc,
                ),
              ],
            ),
          ],
        ),
      );
}

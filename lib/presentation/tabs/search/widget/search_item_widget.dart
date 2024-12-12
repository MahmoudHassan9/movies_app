import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../data/models/movie.dart';

class SearchItemWidget extends StatelessWidget {
  final Movie movie;

  const SearchItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: movie.posterPath != null
                ? AppConstants.imageBase + movie.posterPath!
                : AppConstants.imageBase,
            width: 100.w,
            height: 150.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.yellow,
            )),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.grey),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.originalTitle ?? AppConstants.noTitle,
                  style: AppStyles.popularMovieTitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  movie.releaseDate != null
                      ? '${AppConstants.movieDate} ${movie.releaseDate}'
                      : AppConstants.noDate,
                  style: AppStyles.movieDetailsReleaseDate,
                ),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    Text(movie.voteAverage.toString() ?? '0',style: AppStyles.movieDetailsReleaseDate,),
                    Icon(Icons.star, color: AppColors.yellow, size: 16.sp,)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

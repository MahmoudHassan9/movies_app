import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/models/movie_categories_details/Results.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class SearchItemWidget extends StatelessWidget {
  final Results results;

  const SearchItemWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: results.posterPath != null
                ? AppConstants.imageBase + results.posterPath!
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
                  results.originalTitle ?? AppConstants.noTitle,
                  style: AppStyles.popularMovieTitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  results.releaseDate != null
                      ? '${AppConstants.movieDate} ${results.releaseDate}'
                      : AppConstants.noDate,
                  style: AppStyles.movieDetailsReleaseDate,
                ),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    Text(results.voteAverage.toString() ?? '0',style: AppStyles.movieDetailsReleaseDate,),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/data/models/movie_categories_details/Results.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';

class CategoryDetailsItem extends StatelessWidget {
  CategoryDetailsItem({super.key, required this.results});

  Results results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        color: AppColors.scaffoldBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
                style: AppStyles.movieDetailsName,
                child: Text(results.title ?? '')),
            SizedBox(height: 5.h),
            DefaultTextStyle(
                style: AppStyles.movieDetailsReleaseDate,
                child: Text(results.releaseDate ?? '')),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.imageBase + results.posterPath!,
                    fit: BoxFit.fill,
                    width: 150.w,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  REdgeInsets.all(12),
                    child: DefaultTextStyle(
                        style: AppStyles.movieDetailsOverView,
                        child: Text(  results.overview != null && results.overview!.length > 200
                            ? '${results.overview!.substring(0, 200)}...'
                            : results.overview ?? '',)),
                  ),
                ),
                Row(
                  children: [
                    DefaultTextStyle(
                        style: AppStyles.movieDetailsReleaseDate
                            .copyWith(fontSize: 15.sp),
                        child: Text(results.voteAverage.toString() ?? '')),
                    SizedBox(width: 5.w,),
                    Icon(Icons.star , color: Colors.yellow,size: 20.sp,)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

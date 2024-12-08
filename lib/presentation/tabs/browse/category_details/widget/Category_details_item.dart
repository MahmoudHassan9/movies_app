import 'package:cached_network_image/cached_network_image.dart';
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
    return Container(
        padding: const EdgeInsets.all(15),
        color: AppColors.scaffoldBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: AppConstants.imageBase + results.posterPath!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  results.title != null && results.title!.length > 10
                      ? '${results.title!.substring(0, 10)}..'
                      : results.title ?? '',
                  style: AppStyles.movieDetailsName,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12.sp,
                ),
                Text(
                  results.voteAverage.toString(),
                  style: AppStyles.movieDetailsReleaseDate,
                ),
              ],
            )
          ],
        ));
  }
}

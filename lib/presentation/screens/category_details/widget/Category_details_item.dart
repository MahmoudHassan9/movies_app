import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../data/models/movie.dart';
import '../../../common/loading_widget.dart';

class CategoryDetailsItem extends StatelessWidget {
  const CategoryDetailsItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        color: AppColors.scaffoldBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: CachedNetworkImage(
                  imageUrl: AppConstants.imageBase + movie.posterPath!,
                  placeholder: (context, url) => const LoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              movie.title!,
              // movie.title != null && movie.title!.length > 10
              //     ? '${movie.title!.substring(0, 10)}..'
              //     : movie.title ?? '',
              style: AppStyles.movieDetailsName,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 12.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  movie.voteAverage.toString(),
                  style: AppStyles.movieDetailsReleaseDate,
                ),
              ],
            )
          ],
        ));
  }
}

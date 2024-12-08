import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';

class CategoryItemView extends StatelessWidget {
   CategoryItemView({super.key, required this.genres});
  Genres genres;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius : BorderRadius.all(Radius.circular(14.r)),
            image: const DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
                image: AssetImage(AppAssets.moviesCategoryPic),
                fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Text(
            genres.name ?? '',
            style: AppStyles.categoryName,
          ),
        ),
      ],
    );
  }
}

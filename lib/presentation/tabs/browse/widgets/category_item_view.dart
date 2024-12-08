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
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 8,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                AppAssets.moviesCategoryPic,
                fit: BoxFit.cover,
                width: 180.w,
                height: 120.h,
                colorBlendMode: BlendMode.darken,
                color: Colors.black54,
              )),
        ),
        Text(
          genres.name ?? '',
          style: AppStyles.categoryName,
        )
      ],
    );
  }
}

//Container(
//           height: 90.h,
//           width: 158.w,
//           decoration:  BoxDecoration(
//             borderRadius : BorderRadius.all(Radius.circular(14.r)),
//             image: const DecorationImage(
//                 colorFilter: ColorFilter.mode(
//                   Colors.black54,
//                   BlendMode.darken,
//                 ),
//                 image: AssetImage(AppAssets.moviesCategoryPic),
//                 fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Center(
//           child: Text(
//             genres.name ?? '',
//             style: AppStyles.categoryName,
//           ),
//         ),

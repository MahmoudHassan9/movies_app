import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/data/models/popular_movie.dart';

import '../../../../core/utils/app_assets.dart';

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

  Widget imageBackGround() => Container(
        height: 217.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              AppConstants.imageBase + movie.backdropPath!,
            ),
          ),
        ),
      );

  Widget imagePoster() => Positioned(
        bottom: 0.h,
        left: 21.w,
        child: Container(
          height: 199.h,
          width: 129.w,
          padding: EdgeInsets.zero,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                AppConstants.imageBase + movie.posterPath!,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                4,
              ),
            ),
          ),
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
      );

  Widget imageDetails() => Positioned(
        left: 164.w,
        bottom: 40.h,
        child: const Text(
          'data',
          style: TextStyle(color: Colors.white),
        ),
      );
}

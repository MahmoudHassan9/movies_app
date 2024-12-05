import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class MoviesSliderImage extends StatelessWidget {
  const MoviesSliderImage({
    super.key,
    required this.bgPath,
    required this.posterPath,
  });

  final String bgPath;
  final String posterPath;

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
              bgPath,
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
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                posterPath,
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

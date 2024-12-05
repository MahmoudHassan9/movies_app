import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';

class MoviesSliderImage extends StatelessWidget {
  const MoviesSliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 217.h,
          color: Colors.blueAccent,
          // decoration: const BoxDecoration(
          //
          //   image: DecorationImage(
          //     image: NetworkImage(
          //       '',
          //     ),
          //   ),
          // ),
        ),
        Positioned(
          bottom: 0.h,
          left: 21.w,
          child: Container(
            height: 199.h,
            width: 129.w,
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  4,
                ),
              ),
            ),
            child: const ImageIcon(
              size: 30,
              AssetImage(
                AppAssets.addBookMarkIcon,
              ),
            ),
          ),
        ),
        Positioned(
          left: 164.w,
          bottom: 40.h,
          child: Text(
            'data',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

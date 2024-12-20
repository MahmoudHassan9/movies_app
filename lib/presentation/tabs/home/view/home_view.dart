import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/presentation/tabs/home/widgets/recommended_list.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_constants.dart';
import '../widgets/movies_slider.dart';
import '../widgets/new_releases_list.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoviesSlider(),
        SizedBox(
          height: 28.h,
        ),
        const NewReleasesList(),
        SizedBox(height: 28.h,),
        const RecommendedList(),
      ],
    );
  }
}



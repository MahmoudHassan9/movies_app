import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/search/viewModel/state/search_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../data/api/api_manager.dart';
import '../../../../data/models/movie.dart';
import '../viewModel/cubit/search_cubit.dart';
import '../widget/search_item_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var cubit = getIt<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 34,
              vertical: 16,
            ),
            child: SizedBox(
              height: 50.h,
              child: TextField(
                onChanged: (value) {
                  cubit.search(value);
                },
                style: AppStyles.searchHint.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                  hintText: AppConstants.search,
                  hintStyle: AppStyles.searchHint,
                  filled: true,
                  fillColor: AppColors.searchBar,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                // decoration: InputDecoration(
                //   prefixIcon: Icon(
                //     Icons.search,
                //     color: Colors.white,
                //     size: 30.sp,
                //   ),
                //   hintText: AppConstants.search,
                //   hintStyle: AppStyles.searchHint,
                //   focusedBorder: OutlineInputBorder(
                //     borderSide: const BorderSide(
                //       color: Colors.white,
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(
                //         28.r,
                //       ),
                //     ),
                //   ),
                //   enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: Colors.white,
                //       width: 0.5.w,
                //     ),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(
                //         25.r,
                //       ),
                //     ),
                //   ),
                //   fillColor: AppColors.searchBar,
                //   filled: true,
                // ),
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              switch (state) {
                case SearchInitialState():
                  return emptySearchList();
                case SearchSuccessState():
                  return searchList(state.list);
                case SearchLoadingState():
                  return const Expanded(
                    child: const LoadingWidget(),
                  );
                case SearchErrorState():
                  return const Text('Error');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget searchList(list) => Expanded(
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
            endIndent: 20.w,
            indent: 20.w,
          ),
          itemBuilder: (context, index) {
            return SearchItemWidget(
              movie: list[index],
            );
          },
        ),
      );

  Widget emptySearchList() => Padding(
        padding: REdgeInsets.only(
          top: 52,
          left: 22,
          right: 22,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100.h,
            ),
            const ImageIcon(
              AssetImage(
                AppAssets.moviesIcon,
              ),
              color: Color(0xFFB5B4B4),
              size: 80,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'No Movies Yet !',
              textAlign: TextAlign.center,
              style: AppStyles.homeListTitle,
            ),
          ],
        ),
      );
}

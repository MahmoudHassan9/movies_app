import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/tabs/browse/viewModel/cubit/browse_cubit.dart';
import 'package:movies_app/presentation/tabs/browse/viewModel/state/browse_state.dart';
import 'package:movies_app/presentation/tabs/browse/widgets/category_item_view.dart';
import 'package:movies_app/routing/routes.dart';
import '../../../../core/utils/app_styles.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowseCubit>()..getCategories(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          switch (state) {
            case BrowseInitialState():
              return const SizedBox();
            case BrowseLoadingState():
              return const LoadingWidget();
            case BrowseErrorState():
              return const Text('Error');
            case BrowseSuccessState():
              return categoriesList(state.list);
          }
        },
      ),
    );
  }

  Widget categoriesList(list) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: REdgeInsets.only(left: 12, top: 18),
            child: Text(
              AppStrings.browseTitle,
              style: AppStyles.browseTitle,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.2),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.categoryDetails,
                    arguments: list[index],
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CategoryDetailsView(
                  //       genres: list[index],
                  //     ),
                  //   ),
                  // );
                },
                child: CategoryItemView(
                  genres: list[index],
                ),
              ),
              itemCount: list.length,
            ),
          ),
        ],
      );
}

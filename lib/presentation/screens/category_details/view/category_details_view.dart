import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/presentation/common/loading_widget.dart';
import 'package:movies_app/presentation/screens/category_details/viewModel/cubit/category_details_cubit.dart';
import 'package:movies_app/presentation/screens/category_details/viewModel/state/category_details_state.dart';
import 'package:movies_app/routing/routes.dart';
import '../../../../../data/api/api_manager.dart';
import '../widget/Category_details_item.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        title: Text(
          category.name ?? '',
          style: AppStyles.movieDetailsAppBar,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_outlined,
              color: Colors.white, size: 28),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<CategoryDetailsCubit>()
          ..getMoviesBasedOnCategoryId(category.id.toString()),
        child: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
          builder: (context, state) {
            switch (state) {
              case CategoryDetailsInitialState():
                return const SizedBox();
              case CategoryDetailsLoadingState():
                return const LoadingWidget();
              case CategoryDetailsSuccessState():
                return moviesGridView(state.list);
              case CategoryDetailsErrorState():
                return Text('Error');
            }
          },
        ),
      ),
    );
  }

  Widget moviesGridView(list) => GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: CategoryDetailsItem(
            movie: list[index],
          ),
        ),
      );
}

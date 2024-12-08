import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/presentation/tabs/browse/widgets/category_item_view.dart';
import '../../../../core/utils/app_styles.dart';
import '../category_details/view/category_details_view.dart';

class BrowesView extends StatefulWidget {
  const BrowesView({super.key});

  @override
  State<BrowesView> createState() => _BrowesViewState();
}

class _BrowesViewState extends State<BrowesView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          List<Genres> genres = snapshot.data?.genres ?? [];
          return Column(
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
                  itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryDetailsView(
                                    genres: genres[index])));
                      },
                      child: CategoryItemView(
                        genres: genres[index],
                      )),
                  itemCount: genres.length,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

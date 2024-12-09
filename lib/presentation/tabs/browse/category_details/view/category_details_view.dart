import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/data/models/movie_categories_details/Results.dart';
import '../../../../../data/api/api_manager.dart';
import '../widget/Category_details_item.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.genres});

  final Genres genres;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        title: Text(genres.name ?? '' , style: AppStyles.movieDetailsAppBar,),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_outlined , color: Colors.white , size: 28),
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getResults(genres.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(child: CircularProgressIndicator(
              color: AppColors.yellow,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Results> results = snapshot.data?.results ?? [];
            if (results.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return GridView.builder(
              itemCount: results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () => print(results[index].id),
                      child: CategoryDetailsItem(results: results[index])),
            );
          }
        },
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/data/models/movie_categories_details/Results.dart';
import '../../../../../data/api/api_manager.dart';
import '../widget/Category_details_item.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.genres});

  final Genres genres;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getResults(genres.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Results> results = snapshot.data?.results ?? [];
          if (results.isEmpty) {
            return const Center(child: Text('No results found.'));
          }
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) =>
                CategoryDetailsItem(results: results[index]),
          );
        }
      },
    );
  }
}

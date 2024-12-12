import 'package:movies_app/data/models/movie.dart';

class MovieCategoryResponse {
  num? page;
  List<Movie>? results;
  num? totalPages;
  num? totalResults;

  MovieCategoryResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieCategoryResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

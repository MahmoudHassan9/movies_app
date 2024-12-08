
import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';

class RecommendedMovieResponse {
  RecommendedMovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResult,
  });

  RecommendedMovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(RecommendedMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResult = json['total_results'];
  }

  num? page;
  List<RecommendedMovie>? results;
  num? totalPages;
  num? totalResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResult;
    return map;
  }
}

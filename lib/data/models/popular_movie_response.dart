import 'package:movies_app/data/models/popular_movie.dart';

class PopularMovieResponse {
  PopularMovieResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResult,
  });

  PopularMovieResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(PopularMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResult = json['total_results'];
  }

  num? page;
  List<PopularMovie>? results;
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

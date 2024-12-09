

import '../movie.dart';

class MoreLikeThisMoviesResponse {
  MoreLikeThisMoviesResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResult,
  });

  MoreLikeThisMoviesResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResult = json['total_results'];
  }

  num? page;
  List<Movie>? results;
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

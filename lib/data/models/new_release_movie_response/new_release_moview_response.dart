import 'Dates.dart';
import 'new_releases_movie.dart';

class NewReleasesMoviesResponse {
  NewReleasesMoviesResponse({
      this.dates, 
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalNewReleaseMovie,});

  NewReleasesMoviesResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(NewReleaseMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalNewReleaseMovie = json['total_results'];
  }
  Dates? dates;
  num? page;
  List<NewReleaseMovie>? results;
  num? totalPages;
  num? totalNewReleaseMovie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalNewReleaseMovie;
    return map;
  }

}
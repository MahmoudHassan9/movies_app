import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/models/new_release_movie_response/new_release_moview_response.dart';
import 'package:movies_app/data/models/new_release_movie_response/new_releases_movie.dart';
import 'package:movies_app/data/models/popular_movie_response/popular_movie_response.dart';

import '../../result.dart';
import '../models/popular_movie_response/popular_movie.dart';

class ApiManager {
  static const String baseURL = 'api.themoviedb.org';
  static const String popularEndPoint = '/3/movie/popular';
  static const String newReleasesEndPoint = '/3/movie/upcoming';
  static const String apiKey =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMjY3ZDY3OGU4NzNhMjk4ZWQ0OGJkNDM4NTg1MTlkOCIsIm5iZiI6MTczMzQzMzYzNC43NjQsInN1YiI6IjY3NTIxOTIyNzJkMWE4YTU5YzI5OTQxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zb2Gw0CY9sbHyzypzk0_0oqLNvx7PvpEGRHqYJF2mHo';

  Future<Result<List<PopularMovie>>> getPopularMovies() async {
    Uri url = Uri.https(
      baseURL,
      popularEndPoint,
    );
    try {
      var response = await http.get(url, headers: {
        'Authorization': apiKey,
      });
      var json = jsonDecode(response.body);
      PopularMovieResponse popularMovieResponse =
          PopularMovieResponse.fromJson(json);
      return Success(data: popularMovieResponse.results ?? []);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  Future<Result<List<NewReleaseMovie>>> getNewReleasesMovies() async {
    Uri url = Uri.https(
      baseURL,
      newReleasesEndPoint,
    );
    try {
      var response = await http.get(url, headers: {
        'Authorization': apiKey,
      });
      var json = jsonDecode(response.body);
      NewReleasesMoviesResponse newReleasesMoviesResponse =
          NewReleasesMoviesResponse.fromJson(json);
      log(newReleasesMoviesResponse.results.toString());
      return Success(data: newReleasesMoviesResponse.results ?? []);

    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}

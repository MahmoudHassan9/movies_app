import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/models/movie_categories_details/result_response.dart';
import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/data/models/popular_movie_response.dart';

import '../../result.dart';
import '../models/movie_categories/genre_response.dart';

class ApiManager {
  static const String baseURL = 'api.themoviedb.org';
  static const String popularEndPoint = '/3/movie/popular';
  static const String genresEndPoint = '3/genre/movie/list';
  static const String resultsEndPoint = '3/discover/movie';
  static const String searchEngineEndPoint = '3/search/movie';
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
  static Future<GenreResponse> getGenres() async {
    Uri url = Uri.https(baseURL, genresEndPoint);
    var response = await http.get(url, headers: {
      'Authorization': apiKey,
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return GenreResponse.fromJson(json);
    } else {
      throw Exception('Failed ${response.statusCode}');
    }
  }

  static Future<ResultResponse> getResults(String genreId) async {
    Uri url = Uri.https(baseURL, resultsEndPoint, {
      'with_genres': genreId,
      'page': '1'
    });
    var response = await http.get(url, headers: {
      'Authorization': apiKey,
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ResultResponse.fromJson(json);
    } else {
      throw Exception('Failed ${response.statusCode}');
    }
  }

  static Future<ResultResponse> getSearchResults(String query) async {
    Uri url = Uri.https(baseURL, searchEngineEndPoint, {
      'query': query,
      'page': '1'
    });
    var response = await http.get(url, headers: {
      'Authorization': apiKey,
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ResultResponse.fromJson(json);
    } else {
      throw Exception('Failed ${response.statusCode}');
    }
  }
}

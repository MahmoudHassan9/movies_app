class MovieEntity {
  String? title;
  String? posterPath;
  String? releaseDate;
  String? overview;
  String? backdropPath;
  bool? isWatchList;
  num? voteAverage;
  dynamic id;

  MovieEntity({
    this.posterPath,
    this.releaseDate,
    this.isWatchList,
    this.backdropPath,
    this.overview,
    this.voteAverage,
    this.title,
    this.id,
  });

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    map['isWatchList'] = isWatchList;
    return map;
  }
}

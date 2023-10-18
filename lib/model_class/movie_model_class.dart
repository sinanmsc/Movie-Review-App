// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  DateTime? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  DateTime? firstAirDate;
  List<String>? originCountry;
  bool favs;
  bool read;

  Result({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
    this.favs = false,
    this.read = false,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : json["release_date"] == ''
                ? null
                : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : json["first_air_date"] == ""
                ? null
                : DateTime.parse(json["first_air_date"]),
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}

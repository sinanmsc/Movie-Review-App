// To parse this JSON data, do
//
//     final tvModel = tvModelFromJson(jsonString);

import 'dart:convert';

TvModel tvModelFromJson(String str) => TvModel.fromJson(json.decode(str));

String tvModelToJson(TvModel data) => json.encode(data.toJson());

class TvModel {
  int? page;
  List<TvResult>? results;
  int? totalPages;
  int? totalResults;

  TvModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<TvResult>.from(
                json["results"]!.map((x) => TvResult.fromJson(x))),
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

class TvResult {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  DateTime? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;

  TvResult({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory TvResult.fromJson(Map<String, dynamic> json) => TvResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
      };
}

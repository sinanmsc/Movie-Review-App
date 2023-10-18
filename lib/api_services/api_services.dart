import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movieapp/model_class/cast_model_class.dart';
import 'package:movieapp/model_class/for_geners.dart';
import 'package:movieapp/model_class/movie_model_class.dart';

class ApiServices {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': 'bdeb992ccd134bf14158637b58751105'},
    ),
  );
  Future<MovieModel?> getTrending() async {
    try {
      Response response = await dio.get('/trending/all/day');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<MovieModel?> getTrendingWeek() async {
    try {
      Response response = await dio.get('/trending/all/week');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<MovieModel?> getPopularOnTv() async {
    try {
      Response response = await dio.get('/tv/popular');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<CAst?> getMovieCast(int id) async {
    try {
      Response response = await dio.get('/movie/$id/credits');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return cAstFromJson(json);
      }
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<MovieModel?> getSearch(String query) async {
    try {
      Response response =
          await dio.get('/search/multi', queryParameters: {"query": query});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<ForGeners?> getGener(int ids) async {
    try {
      Response response = await dio.get('/movie/$ids');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return forGenersFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }
}

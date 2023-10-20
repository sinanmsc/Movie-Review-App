import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/model_class/language_model.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/model_class/cast_model_class.dart';
import 'package:movieapp/model_class/for_geners.dart';
import 'package:movieapp/model_class/movie_model_class.dart';

final apiSerivicesProvider = Provider((ref) => ApiServices());

final getTrentingProvider = FutureProvider<MovieModel?>(
    (ref) => ref.read(apiSerivicesProvider).getTrending());

final getTrentingWeekProvider = FutureProvider<MovieModel?>(
    (ref) => ref.read(apiSerivicesProvider).getTrendingWeek());

final getPopularOnTvProvider = FutureProvider<MovieModel?>(
    (ref) => ref.read(apiSerivicesProvider).getPopularOnTv());

final getMovieCastProvider = FutureProvider.family<CAst?, int>(
    (ref, id) => ref.read(apiSerivicesProvider).getMovieCast(id));

final getSearchProvider = FutureProvider.family<MovieModel?, String>(
    (ref, query) => ref.read(apiSerivicesProvider).getSearch(query));

final searchStringProvider = StateProvider<String>((ref) => '');

final getgenerProvider = FutureProvider.family<ForGeners?, int>(
    (ref, ids) => ref.read(apiSerivicesProvider).getGener(ids));

final getLanguageProvider = FutureProvider<List<LanguageModel>?>((ref) async {
  return ref.read(apiSerivicesProvider).getLanguage();
});

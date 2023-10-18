import 'package:movieapp/model_class/movie_model_class.dart';

class FavModel {
  final String title;
  final bool isFav;
  final String image;
  final Result alldata;

  FavModel({required this.title, this.isFav = false, required this.image,required this.alldata});
}

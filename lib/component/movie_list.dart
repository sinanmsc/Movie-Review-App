import 'package:flutter/material.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/movie_container.dart';
import 'package:movieapp/model_class/movie_model_class.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Result>? datas;

  const MovieList({
    super.key,
    required this.title,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    print("object2");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: Responsive.width(25, context),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: Responsive.height(10, context)),
        SizedBox(
          height: Responsive.height(250, context),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieContainer(
                  data: datas![index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: datas!.length),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/model_class/movie_model_class.dart';
import 'package:movieapp/view/details.dart';

class MovieContainer extends StatelessWidget {
  final Result data;

  const MovieContainer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    print("object3");

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              data: data,
            ),
          )),
      child: Container(
        height: Responsive.height(220, context),
        width: Responsive.width(170, context),
        decoration: BoxDecoration(
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 49, 108, 197),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
              ),
              width: 4,
            ),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(Responsive.width(18, context))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Responsive.width(14, context)),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${data.posterPath}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

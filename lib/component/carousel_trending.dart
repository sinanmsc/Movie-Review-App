import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/providers/providers.dart';
import 'package:movieapp/view/details.dart';

class CarouselTrending extends ConsumerWidget {
  const CarouselTrending({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trending = ref.watch(getTrentingProvider);
    return trending.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: Text('Somthing Wrong'),
          );
        }
        return CarouselSlider.builder(
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      data: data.results![index],
                    ),
                  )),
              child: Container(
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 49, 108, 197),
                        ],
                      ),
                      width: 4,
                    ),
                    borderRadius:
                        BorderRadius.circular(Responsive.width(15, context)),
                    color: Colors.black),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Responsive.width(15, context)),
                      child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  stops: [0, 0.7],
                                  colors: [Colors.black, Colors.white])
                              .createShader(bounds),
                          child: trending.when(
                            data: (data) {
                              if (data == null) {
                                return const Center(
                                    child: Text('Somthing\tWrong'));
                              }
                              return Image.network(
                                'https://image.tmdb.org/t/p/w500/${data.results![index].backdropPath}',
                                fit: BoxFit.contain,
                                height: MediaQuery.sizeOf(context).height,
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text('$error'),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Image.asset(
                        'assets/trending-removebg-preview.png',
                        width: Responsive.width(100, context),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: data.results!.length,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 1.8,
            enlargeFactor: 0.2,
            enlargeCenterPage: true,
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('$error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

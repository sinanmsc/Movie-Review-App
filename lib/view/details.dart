// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/model_class/fav_model.dart';
import 'package:movieapp/model_class/movie_model_class.dart';
import 'package:movieapp/notifiers/fav_notifier.dart';
import 'package:movieapp/providers/providers.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends ConsumerWidget {
  final Result data;

  const DetailsPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.watch(readProvider);
    final fav = ref.watch(favProvider);
    final cast = ref.watch(getMovieCastProvider(data.id!));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.5,
                      width: MediaQuery.sizeOf(context).width,
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.2, 1],
                                colors: [Color(0xFF2B2352), Colors.white])
                            .createShader(bounds),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${data.posterPath}',
                          fit: BoxFit.contain,
                        ),
                      )),
                  Positioned(
                    bottom: Responsive.width(5, context),
                    left: Responsive.width(20, context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.width(20, context),
                        vertical: Responsive.height(15, context),
                      ),
                      width: Responsive.width(360, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(87, 150, 137, 214),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 230,
                                child: Text(
                                  data.title == null ? data.name! : data.title!,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              InkWell(
                                child: Icon(Icons.share),
                                onTap: () {
                                  print('object');
                                  Share.share(
                                    data.name == null
                                        ? '${data.title}\n\nRate:\t${data.voteAverage.toString()}\n\n${data.overview}'
                                        : '${data.name}\n\nRate:\t${data.voteAverage.toString()}\n\n${data.overview}',
                                  );
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  ref.read(favProvider.notifier).state =
                                      !ref.read(favProvider.notifier).state;
                                  data.favs = !data.favs;
                                  data.favs
                                      ? ref
                                          .read(favNotifierProvider.notifier)
                                          .addingToFav(
                                            FavModel(
                                              title: data.title == null
                                                  ? data.name!
                                                  : data.title!,
                                              image: data.backdropPath!,
                                              isFav: data.favs,
                                              alldata: data,
                                            ),
                                          )
                                      : ref
                                          .read(favNotifierProvider.notifier)
                                          .removeFav(
                                            FavModel(
                                              title: data.title == null
                                                  ? data.name!
                                                  : data.title!,
                                              image: data.backdropPath!,
                                              isFav: data.favs,
                                              alldata: data,
                                            ),
                                          );
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: data.favs == true
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: Responsive.height(10, context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.height(42, context),
                                width: Responsive.width(130, context),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF31bbc5),
                                      Color.fromARGB(255, 49, 108, 197),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Responsive.width(30, context),
                                  ),
                                ),
                                child: Text(
                                  data.releaseDate == null &&
                                          data.firstAirDate == null
                                      ? ""
                                      : data.releaseDate == null
                                          ? DateFormat("dd-MM-yyyy")
                                              .format(data.firstAirDate!)
                                          : DateFormat("dd-MM-yyyy")
                                              .format(data.releaseDate!),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Responsive.width(19, context),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.height(42, context),
                                width: Responsive.width(130, context),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 49, 108, 197),
                                      Color(0xFF31bbc5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Responsive.width(30, context),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.voteAverage!.toStringAsFixed(1),
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Responsive.width(19, context),
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: Responsive.width(25, context),
                      top: Responsive.width(5, context),
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.navigate_before)),
                      ))
                ],
              ),
              SizedBox(height: Responsive.height(20, context)),
              Padding(
                padding: EdgeInsets.all(Responsive.width(10, context)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Responsive.width(20, context),
                        ),
                        color: Colors.white.withOpacity(0.12),
                      ),
                      padding: EdgeInsets.all(Responsive.width(12, context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plot',
                            style: TextStyle(
                                fontSize: Responsive.width(25, context),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: Responsive.height(5, context)),
                          Text(
                            data.overview!,
                            style: TextStyle(
                              fontSize: Responsive.width(20, context),
                            ),
                            maxLines: data.read == false ? 2 : null,
                            overflow: TextOverflow.fade,
                          ),
                          InkWell(
                            onTap: () {
                              data.read = !data.read;
                              ref.read(readProvider.notifier).state =
                                  !ref.read(readProvider.notifier).state;
                            },
                            child: Text(
                              data.read == false ? 'Read More' : 'Read Less',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Responsive.height(25, context)),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cast',
                            style: TextStyle(
                                fontSize: Responsive.width(24, context),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: Responsive.height(12, context)),
                          SizedBox(
                              height: 150,
                              child: cast.when(
                                data: (data) {
                                  if (data == null) {
                                    return const Center(
                                        child: Text('Somthing\tWrong'));
                                  }
                                  return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        if (data.cast![index].profilePath ==
                                            null) {
                                          return Column(
                                            children: [
                                              CircleAvatar(
                                                radius: Responsive.width(
                                                    40, context),
                                                backgroundColor: Colors.grey,
                                                child: const Icon(Icons.person),
                                              ),
                                            ],
                                          );
                                        }
                                        return Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius:
                                                  Responsive.width(40, context),
                                              backgroundImage: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${data.cast![index].profilePath}'),
                                            ),
                                            SizedBox(
                                                height: Responsive.height(
                                                    15, context)),
                                                    
                                            SizedBox(
                                              width: Responsive.width(
                                                  100, context),
                                              child: Text(
                                                data.cast![index].name!,
                                                style: const TextStyle(
                                                    fontSize: 15),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                              width: Responsive.width(
                                                  20, context)),
                                      itemCount: data.cast!.length);
                                },
                                error: (error, stackTrace) =>
                                    Center(child: Text('$error')),
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final readProvider = StateProvider<bool>((ref) {
  return false;
});

final favProvider = StateProvider<bool>((ref) {
  return false;
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/notifiers/fav_notifier.dart';

import 'details.dart';

class Library extends ConsumerWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool fav = ref.watch(favProvider);
    final favs = ref.watch(favNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Responsive.width(14, context)),
          child: favs.isEmpty
              ? const Center(
                  child: Text(
                    "Empty Favorites",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: favs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(Responsive.width(10, context)),
                      height: Responsive.height(80, context),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31bbc5),
                              Color.fromARGB(255, 49, 108, 197),
                            ],
                          ),
                          width: 3,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://image.tmdb.org/t/p/w500${favs[index].image}'),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(data: favs[index].alldata),
                                )),
                            child: SizedBox(
                              width: Responsive.width(170, context),
                              child: Text(
                                favs[index].title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                ref.read(favProvider.notifier).state =
                                    !ref.read(favProvider.notifier).state;

                                ref
                                    .read(favNotifierProvider.notifier)
                                    .removeFav(favs[index]);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: Responsive.width(12, context)),
                ),
        ),
      ),
    );
  }
}

// final favProvider = StateProvider<bool>((ref) {
//   return false;
// });

// class FavModel {
//   String Name;
//   bool fav;
//   FavModel({required this.Name, this.fav=true});
// }

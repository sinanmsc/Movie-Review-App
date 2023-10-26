import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/carousel_trending.dart';
import 'package:movieapp/component/movie_list.dart';
import 'package:movieapp/providers/auth_provider.dart';
import 'package:movieapp/providers/firestore_provider.dart';
import 'package:movieapp/providers/image_picker_provider.dart';
import 'package:movieapp/providers/providers.dart';
import 'package:movieapp/services/firestore_services.dart';
import 'package:movieapp/services/storage_services.dart';
import 'package:movieapp/view/library.dart';
import 'package:movieapp/view/search_page.dart';

class HomePage extends ConsumerWidget {
  final String uid;
  const HomePage({super.key, required this.uid});
  static ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingWeak = ref.watch(getTrentingWeekProvider);
    final popularOnTv = ref.watch(getPopularOnTvProvider);
    print("object");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ShaderMask(
          shaderCallback: (bounds) => const RadialGradient(
            radius: 2,
            center: Alignment.centerLeft,
            colors: [
              Color(0xFF31bbc5),
              Color.fromARGB(255, 49, 108, 197),
            ],
          ).createShader(bounds),
          child: Text(
            'CineMagic',
            style: TextStyle(
                fontFamily: 'style1',
                fontSize: Responsive.width(35, context),
                fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                size: 35,
                color: Color(0xFF31bbc5),
              ))
        ],
      ),
      drawer: Drawer(
          child: ref.watch(readUserProvider(uid)).when(
                data: (data) => ListView(
                  children: [
                    DrawerHeader(
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
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
                                  height: 100,
                                  width: 100,
                                  // padding: EdgeInsets.all(1),
                                  clipBehavior: Clip.antiAlias,
                                  child: data["profileUrl"] != null
                                      ? Image.network(
                                          data["profileUrl"],
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(data["name"])
                              ],
                            ),
                            Positioned(
                              right: -10,
                              bottom: 40,
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return Container(
                                        color: Colors.white,
                                        height: Responsive.height(150, context),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: Responsive.height(
                                                    20, context)),
                                            SizedBox(
                                                height: Responsive.height(
                                                    10, context)),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Responsive.width(
                                                      1.9, context)),
                                              alignment: Alignment.center,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Responsive.width(10, context),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Change profile photo with',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () async {
                                                          XFile? pickedImage =
                                                              await imagePicker
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .camera);
                                                          ref
                                                              .read(
                                                                  profilePathProvider
                                                                      .notifier)
                                                              .state = pickedImage;
                                                         
                                                        },
                                                        icon: const Icon(Icons
                                                            .camera_alt_outlined),
                                                        color: Colors.black,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.photo),
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                  TextButton(
                                                      onPressed: () async {
                                                        // final url = await ref.watch(
                                                        //     profileImageProvider(
                                                        //         ref.watch(
                                                        //             profilePathProvider)!));
                                                        final url = await StrorageService
                                                            .uploadProfileImage(
                                                                ref.watch(
                                                                    profilePathProvider)!,
                                                                "$uid.jpg");

                                                        FirestoreServices
                                                            .updateImage(
                                                                uid, url);
                                                        ref.invalidate(
                                                            readUserProvider);
                                                        if (context.mounted) {
                                                          ref
                                                              .read(
                                                                  profilePathProvider
                                                                      .notifier)
                                                              .state = null;
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Text('Done'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: const GradientBoxBorder(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF31bbc5),
                                            Color.fromARGB(255, 49, 108, 197),
                                          ],
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(
                                      Responsive.width(30, context),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                      Text(
                                        'Edit ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(authServicesProvider).logout();
                      },
                      child: Container(
                        margin: EdgeInsets.all(Responsive.width(10, context)),
                        alignment: Alignment.center,
                        height: Responsive.height(50, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Responsive.width(30, context)),
                            border: Border.all(
                                width: Responsive.width(1, context),
                                color: Colors.white)),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Responsive.width(25, context)),
                        ),
                      ),
                    )
                  ],
                ),
                error: (error, stackTrace) => Center(
                  child: Text("$error"),
                ),
                loading: () => const Center(
                  child: Text("Loading..."),
                ),
              )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Responsive.width(10, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarouselTrending(),
                SizedBox(height: Responsive.height(15, context)),
                trendingWeak.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return MovieList(
                        title: 'Trending This Week',
                        datas: data.results,
                      );
                    },
                    error: (error, stackTrace) => Center(child: Text('$error')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator())),
                SizedBox(height: Responsive.height(15, context)),
                popularOnTv.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return MovieList(
                        title: 'Popular on TV',
                        datas: data.results,
                      );
                    },
                    error: (error, stackTrace) => Center(child: Text('$error')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator())),
                // SizedBox(height: Responsive.height(15, context)),
                // MovieList(title: 'Popular in Theatre'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Library(),
              ));
        },
        child: const Icon(
          Icons.library_add,
          color: Colors.white,
        ),
      ),
    );
  }
}

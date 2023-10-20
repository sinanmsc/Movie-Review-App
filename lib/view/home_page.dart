import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/carousel_trending.dart';
import 'package:movieapp/component/movie_list.dart';
import 'package:movieapp/providers/auth_provider.dart';
import 'package:movieapp/providers/providers.dart';
import 'package:movieapp/view/library.dart';
import 'package:movieapp/view/search_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
          child: ListView(
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
                              width: 3),
                        ),
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Name')
                    ],
                  ),
                  Positioned(
                    right: -10,
                    bottom: 37,
                    child: Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(
                              Responsive.width(30, context))),
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
                  borderRadius:
                      BorderRadius.circular(Responsive.width(30, context)),
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

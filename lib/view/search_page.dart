import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:movieapp/Responsive/responsive.dart';
import 'package:movieapp/component/text_field.dart';
import 'package:movieapp/providers/providers.dart';
import 'package:movieapp/view/details.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchValue = ref.watch(searchStringProvider);
    // ignore: unused_local_variable
    final search = ref.watch(getSearchProvider(searchValue));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Responsive.width(12, context)),
        child: Column(
          children: [
            SizedBox(
              height: Responsive.height(100, context),
              width: double.infinity,
              child: CustomeTextfield(
                label: 'Search',
                icon: const Icon(Icons.search),
                onChanged: (value) {
                  ref.read(searchStringProvider.notifier).state = value;
                  // ref.invalidate(getSearchProvider);
                },
              ),
            ),
            SizedBox(height: Responsive.height(10, context)),
            Expanded(
                child: search.when(
              data: (data) {
                if (data == null) {
                  return const Center(child: Text('Sonthing\tWrong'));
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final generId =
                          ref.watch(getgenerProvider(data.results![index].id!));
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(data: data.results![index]),
                            )),
                        child: Container(
                          height: Responsive.height(200, context),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF31bbc5),
                                  Color.fromARGB(255, 49, 108, 197)
                                ],
                              ),
                            ),
                          ),
                          padding:
                              EdgeInsets.all(Responsive.width(15, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                data.results![index].posterPath == null
                                    ? 'https://image.tmdb.org/t/p/w500/${data.results![index].backdropPath}'
                                    : data.results![index].backdropPath == null
                                        ? 'https://img.freepik.com/free-vector/cinema-realistic-poster-with-illuminated-bucket-popcorn-drink-3d-glasses-reel-tickets-blue-background-with-tapes-vector-illustration_1284-77070.jpg'
                                        : 'https://image.tmdb.org/t/p/w500/${data.results![index].posterPath}',
                                width: Responsive.width(100, context),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: Responsive.width(190, context),
                                    child: Text(
                                      data.results![index].title == null
                                          ? data.results![index].name!
                                          : data.results![index].title!,
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.width(20, context),
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  generId.when(
                                    data: (data) {
                                      if (data == null) {
                                        return const Text('Drama');
                                      }
                                      return Container(
                                        alignment: Alignment.center,
                                        height: Responsive.height(20, context),
                                        width: Responsive.width(190, context),
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                // data.results![index].genreIds!.toString(),
                                                data.genres![index].name!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Responsive.width(
                                                      15, context),
                                                ),
                                                textAlign: TextAlign.justify,
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Text(' '),
                                            itemCount: data.genres!.length),
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        Center(child: Text('$error')),
                                    loading: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  Text(
                                    data.results![index].originalLanguage ==
                                            'en'
                                        ? 'English'
                                        : data.results![index]
                                                    .originalLanguage ==
                                                'fr'
                                            ? 'French'
                                            : data.results![index]
                                                        .originalLanguage ==
                                                    'ja'
                                                ? 'Japanese'
                                                : data.results![index]
                                                            .originalLanguage ==
                                                        'sv'
                                                    ? 'Swedish'
                                                    : data.results![index]
                                                                .originalLanguage ==
                                                            'es'
                                                        ? 'Spanish'
                                                        : data.results![index]
                                                                    .originalLanguage ==
                                                                'kn'
                                                            ? 'Kannada'
                                                            : data
                                                                        .results![
                                                                            index]
                                                                        .originalLanguage ==
                                                                    'tr'
                                                                ? 'Thurkish'
                                                                : data.results![index].originalLanguage ==
                                                                        'pl'
                                                                    ? 'Polish'
                                                                    : data.results![index].originalLanguage ==
                                                                            'it'
                                                                        ? 'Italian'
                                                                        : data.results![index].originalLanguage ==
                                                                                'ar'
                                                                            ? 'Arabic'
                                                                            : data.results![index].originalLanguage == 'ru'
                                                                                ? 'Russian'
                                                                                : data.results![index].originalLanguage == 'ko'
                                                                                    ? 'Korean'
                                                                                    : data.results![index].originalLanguage == 'zh'
                                                                                        ? 'Chinese'
                                                                                        : data.results![index].originalLanguage == 'nl'
                                                                                            ? 'Dutch'
                                                                                            : data.results![index].originalLanguage == 'ml'
                                                                                                ? 'Malayalam'
                                                                                                : data.results![index].originalLanguage == null
                                                                                                    ? ''
                                                                                                    : data.results![index].originalLanguage!,
                                    style: TextStyle(
                                        fontSize:
                                            Responsive.width(20, context)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: Responsive.height(15, context)),
                    itemCount: data.results!.length);
              },
              error: (error, stackTrace) => Center(
                child: Text('$error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ))
          ],
        ),
      )),
    );
  }
}

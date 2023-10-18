// class DetailsPage extends ConsumerWidget {
//   final Result? data;
//   final TvResult? tvdata;

//   DetailsPage({
//     super.key,
//     this.data,
//     this.tvdata,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final read = ref.watch(readProvider);
//     final fav = ref.watch(favProvider);
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                       height: MediaQuery.sizeOf(context).height / 1.5,
//                       width: MediaQuery.sizeOf(context).width,
//                       child: ShaderMask(
//                         shaderCallback: (bounds) => const LinearGradient(
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                                 stops: [0.2, 1],
//                                 colors: [Color(0xFF2B2352), Colors.white])
//                             .createShader(bounds),
//                         child: Image.network(
//                           data == null
//                               ? 'https://image.tmdb.org/t/p/w500${tvdata!.posterPath}'
//                               : 'https://image.tmdb.org/t/p/w500${data!.posterPath}',
//                           fit: BoxFit.contain,
//                         ),
//                       )),
//                   Positioned(
//                     bottom: Responsive.width(5, context),
//                     left: Responsive.width(20, context),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: Responsive.width(20, context),
//                         vertical: Responsive.height(15, context),
//                       ),
//                       width: Responsive.width(360, context),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: const Color.fromARGB(87, 150, 137, 214),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                 width: 250,
//                                 child: Text(
//                                   data == null
//                                       ? tvdata!.name!
//                                       : data!.releaseDate == null
//                                           ? 'Somthing\tWrong'
//                                           : data!.title!,
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   ref.read(favProvider.notifier).state =
//                                       !ref.read(favProvider.notifier).state;
//                                 },
//                                 child: Icon(
//                                   Icons.favorite,
//                                   color:
//                                       fav == true ? Colors.red : Colors.white,
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(height: Responsive.height(10, context)),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: Responsive.height(42, context),
//                                 width: Responsive.width(130, context),
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xFF31bbc5),
//                                       Color.fromARGB(255, 49, 108, 197),
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(
//                                     Responsive.width(30, context),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   data == null
//                                       ? DateFormat("dd-MM-yyyy")
//                                           .format(tvdata!.firstAirDate!)
//                                       : data!.releaseDate == null
//                                           ? 'Somthing\tWrong'
//                                           : DateFormat("dd-MM-yyyy")
//                                               .format(data!.releaseDate!),
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: Responsive.width(19, context),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: Responsive.height(42, context),
//                                 width: Responsive.width(130, context),
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color.fromARGB(255, 49, 108, 197),
//                                       Color(0xFF31bbc5),
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(
//                                     Responsive.width(30, context),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(data==null?tvdata!.voteAverage!.toStringAsFixed(1):
//                                       data!.voteAverage.toStringAsFixed(1),
//                                       style: TextStyle(
//                                         color: Colors.yellow,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: Responsive.width(19, context),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 7),
//                                     const Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       left: Responsive.width(25, context),
//                       top: Responsive.width(5, context),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.black.withOpacity(0.5),
//                         child: IconButton(
//                             onPressed: () => Navigator.pop(context),
//                             icon: Icon(Icons.navigate_before)),
//                       ))
//                 ],
//               ),
//               SizedBox(height: Responsive.height(20, context)),
//               Padding(
//                 padding: EdgeInsets.all(Responsive.width(10, context)),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       Responsive.width(20, context),
//                     ),
//                     color: Colors.white.withOpacity(0.12),
//                   ),
//                   padding: EdgeInsets.all(Responsive.width(12, context)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Plot',
//                         style: TextStyle(
//                             fontSize: Responsive.width(25, context),
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: Responsive.height(5, context)),
//                       Text(data==null?tvdata!.overview!:
//                         data!.overview,
//                         style: TextStyle(
//                           fontSize: Responsive.width(20, context),
//                         ),
//                         maxLines: read == false ? 2 : null,
//                         overflow: TextOverflow.fade,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           ref.read(readProvider.notifier).state =
//                               !ref.read(readProvider.notifier).state;
//                         },
//                         child: Text(
//                           read == false ? 'Read More' : 'Read Less',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// final readProvider = StateProvider<bool>((ref) {
//   return false;
// });

// final favProvider = StateProvider<bool>((ref) {
//   return false;
// });

// import 'package:flutter/material.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:movieapp/Responsive/responsive.dart';
// import 'package:movieapp/model_class/movie_model_class.dart';
// import 'package:movieapp/model_class/tv_model_class.dart';
// import 'package:movieapp/view/details.dart';

// class MovieContainer extends StatelessWidget {
//   final Result? data;
//   final TvResult? tvdata;

//   const MovieContainer({super.key, this.data, this.tvdata});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailsPage(
//                       data: data==null?null:data,
//                       tvdata: tvdata==null?null:tvdata,
//                     ),
//                   )),
//       child: Container(
//         height: Responsive.height(220, context),
//         width: Responsive.width(170, context),
//         decoration: BoxDecoration(
//             border: const GradientBoxBorder(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 49, 108, 197),
//                   Color.fromARGB(255, 0, 0, 0),
//                 ],
//                 begin: Alignment.topLeft,
//               ),
//               width: 4,
//             ),
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(Responsive.width(18, context))),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(Responsive.width(14, context)),
//           child: Image.network(
//             data == null
//                 ? "https://image.tmdb.org/t/p/w500${tvdata!.posterPath}"
//                 : 'https://image.tmdb.org/t/p/w500${data!.posterPath}',
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     );
//   }
// }

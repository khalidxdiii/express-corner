// import 'package:express_corner/core/constant/colors.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../core/data/models/place_model/place_model.dart';
// import '../../../../../../core/utils/utils.dart';

// class PharmaciesCardItemWidget extends StatelessWidget {
//   const PharmaciesCardItemWidget({
//     Key? key,
//     required this.placeModel,
//     required this.onTap,
//   }) : super(key: key);

//   final PlaceModel placeModel;
//   final void Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         elevation: 4.0,
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Stack(
//                 children: [
//                   Image.network(
//                     placeModel.photos != null && placeModel.photos!.isNotEmpty
//                         ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${placeModel.photos![0].photoReference}&key=${Utils.googleMapsPlacesApiKey}"
//                         : "https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png",
//                     height: 120,
//                     width: double.infinity,
//                     fit: BoxFit.fitWidth,
//                     errorBuilder: (context, error, stackTrace) {
//                       // In case of error loading the image, show an icon
//                       return const SizedBox(
//                         height: 120,
//                         child: Center(
//                           child: Icon(
//                             Icons.store,
//                             size: 48,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       );
//                     },
//                   ),

//                   // Rating Icon section
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 2),
//                       decoration: const BoxDecoration(
//                           color: Colors.amber,
//                           borderRadius:
//                               BorderRadius.only(topLeft: Radius.circular(8))),
//                       child: Row(
//                         children: [
//                           Text(
//                             placeModel.rating.toString(),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           const Icon(
//                             Icons.star,
//                             color: Colors.white,
//                             size: 16,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Favorite Icon section
//                   Positioned(
//                     top: 8,
//                     left: 8,
//                     child: CircleAvatar(
//                       radius: 16,
//                       backgroundColor: Colors.white.withOpacity(0.5),
//                       child: const Icon(
//                         Icons.favorite,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Text section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       placeModel.name.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                           color: Colors.black),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                     Text(
//                       placeModel.vicinity.toString(),
//                       style: const TextStyle(
//                         fontSize: 9,
//                         color: AppColor.primaryColor,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

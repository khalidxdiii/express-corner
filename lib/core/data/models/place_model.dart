// import '../../utils/utils.dart';

// class PlaceModel {
//   final String? name;
//   final String? vicinity;
//   final double? latitude;
//   final double? longitude;
//   final String? placeId;
//   final List<String>? types;
//   final String? icon;
//   final String? imageUrl;
//   final double? rating; // Field for the image URL

//   PlaceModel(
//       {this.name,
//       this.vicinity,
//       this.latitude,
//       this.longitude,
//       this.placeId,
//       this.types,
//       this.icon,
//       this.imageUrl,
//       this.rating // Initialize the image URL
//       });

//   // Factory constructor to create a new Place instance from a map (JSON).
//   factory PlaceModel.fromJson(Map<String, dynamic> json) {
//     String? photoUrl;
//     if (json['photos'] != null && json['photos'].isNotEmpty) {
//       final photoReference = json['photos'][0]['photo_reference'];
//       // Construct the photo URL using the photoReference
//       // Note: Ensure you append your Google API key when constructing the URL
//       photoUrl =
//           'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${Utils.googleMapsPlacesApiKey}';
//     }

//     double rating = (json['rating'] as double?) ?? 0.0;

//     return PlaceModel(
//         name: json['name'],
//         vicinity: json['vicinity'],
//         latitude: json['geometry']['location']['lat'],
//         longitude: json['geometry']['location']['lng'],
//         placeId: json['place_id'],
//         types: List<String>.from(json['types'] ?? []),
//         icon: json['icon'],
//         imageUrl: photoUrl,
//         rating: rating);
//   }

//   // Method to convert Place instance to a map (JSON).
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'vicinity': vicinity,
//       'geometry': {
//         'location': {
//           'lat': latitude,
//           'lng': longitude,
//         },
//       },
//       'place_id': placeId,
//       'types': types,
//       'icon': icon,
//       'rating': rating,
//       'photos': imageUrl != null
//           ? [
//               {
//                 'photo_reference':
//                     imageUrl, // You may want to store the photo_reference instead
//               }
//             ]
//           : [],
//     };
//   }
// }

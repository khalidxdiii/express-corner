import 'geometry.dart';
import 'opening_hours.dart';
import 'photo.dart';
import 'plus_code.dart';

class PlaceModel {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  PlusCode? plusCode;
  double? rating;
  String? reference;
  String? scope;
  List<dynamic>? types;
  int? userRatingsTotal;
  String? vicinity;

  PlaceModel({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        businessStatus: json['business_status'] as String? ?? '',
        geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
        icon: json['icon'] as String? ?? '',
        iconBackgroundColor: json['icon_background_color'] as String? ?? '',
        iconMaskBaseUri: json['icon_mask_base_uri'] as String? ?? '',
        name: json['name'] as String? ?? '',
        openingHours: json['opening_hours'] == null
          ? null
          : OpeningHours.fromJson(json['opening_hours'] as Map<String, dynamic>),
        photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
        placeId: json['place_id'] as String? ?? '',
        plusCode: json['plus_code'] == null
          ? null
          : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
        rating: (json['rating'] as num?)?.toDouble() ?? 0,
        reference: json['reference'] as String? ?? '',
        scope: json['scope'] as String? ?? '',
        types: json['types'] as List<dynamic>? ?? [],
        userRatingsTotal: json['user_ratings_total'] as int? ?? 0,
        vicinity: json['vicinity'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'business_status': businessStatus,
        'geometry': geometry?.toJson(),
        'icon': icon,
        'icon_background_color': iconBackgroundColor,
        'icon_mask_base_uri': iconMaskBaseUri,
        'name': name,
        'opening_hours': openingHours?.toJson(),
        'photos': photos?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        'plus_code': plusCode?.toJson(),
        'rating': rating,
        'reference': reference,
        'scope': scope,
        'types': types,
        'user_ratings_total': userRatingsTotal,
        'vicinity': vicinity,
      };
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DefultRatingBar extends StatelessWidget {
  const DefultRatingBar({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
    this.minRating = 1,
    this.maxRating = 5,
    this.ignoreGestures = false,
    this.allowHalfRating = false,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 4.0),
    this.sizeIcon = 40.0,
  });
  final double initialRating;
  final double minRating;
  final double maxRating;
  final bool ignoreGestures;
  final void Function(double) onRatingUpdate;
  final bool? allowHalfRating;
  final EdgeInsetsGeometry? itemPadding;
  final double? sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        // textDirection: TextDirection.ltr,
        initialRating: initialRating,
        updateOnDrag: true,
        minRating: minRating,
        maxRating: maxRating,
        ignoreGestures: ignoreGestures,
        direction: Axis.horizontal,
        allowHalfRating: allowHalfRating!,
        itemCount: 5,
        itemPadding: itemPadding!,
        itemSize: sizeIcon!,
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: onRatingUpdate,
        //  unratedColor: Colors.white
      ),
    );
  }
}

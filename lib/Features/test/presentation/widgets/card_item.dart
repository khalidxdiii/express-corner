import 'package:cached_network_image/cached_network_image.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.photoUrl,
    required this.title,
    required this.cityName,
  }) : super(key: key);

  final String photoUrl;
  final String title;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (photoUrl.isNotEmpty)
            CachedNetworkImage(
              imageUrl: photoUrl,
              height: 200,
              width: 300,
              fit: BoxFit.cover,
              placeholder: (context, url) => Lottie.asset(
                AppImageAsset.imageLoading,
                height: 70,
                width: 70,
              ),
              errorWidget: (context, url, error) => const Placeholder(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

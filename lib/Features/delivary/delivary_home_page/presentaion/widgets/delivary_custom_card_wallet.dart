import 'package:express_corner/core/constant/colors.dart';
import 'package:express_corner/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class DelivaryCustomCardWallet extends StatelessWidget {
  const DelivaryCustomCardWallet({super.key, required this.total});
  final String total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "رصيد أرباحك هذا الاسبوع",
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0x00ffffff).withOpacity(0.8),
                            fontWeight: FontWeight.normal,
                            height: 1.1,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                          size: 17,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          total,
                          style: const TextStyle(
                              fontSize: 27,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.1),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "جنية مصري",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(AppImageAsset.delivaryWalletCoins,
                  height: 100, width: 100),
            ),
          ),
        ],
      ),
    );
  }
}

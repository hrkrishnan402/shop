import 'package:flutter/material.dart';
import 'package:test_app/common/widgets/custom_button.dart';

import '../../../common/constants/app_strings.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key,
      this.description,
      this.discountPercentage,
      this.imageUrl,
      this.offerPrice,
      this.originalPrice,
      this.quantity,
      required this.title});
  final String? imageUrl;
  final String title;
  final String? description;
  final String? originalPrice;
  final String? offerPrice;
  final String? discountPercentage;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  AppStrings.imageBucketBaseUrl + (imageUrl ?? ""),
                  height: 50,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(description ?? ""),
                    Row(
                      children: [
                        Text(offerPrice ?? ""),
                        Text(
                          originalPrice ?? "",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const Text("10% Off")
                      ],
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Qty"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(quantity.toString()),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: CustomButton(
                        title: "Move to wishlist",
                        isPrimary: false,
                        onPress: () {}))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/common/constants/app_strings.dart';
import 'package:test_app/common/widgets/common_appbar.dart';
import 'package:test_app/common/widgets/custom_button.dart';
import 'package:test_app/controllers/project_detail_controller.dart';

import '../../repository/api/api_repository.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductDetailController(
            GetIt.instance.get<ApiRepository>(), productId),
        builder: (controller) {
          return Scaffold(
            appBar: CommonAppBar(
                title: "Myshop",
                onLeftActionTap: () {},
                onNotificationTap: () {},
                isFavouriteNeeded: true),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: (controller.productDetails?.images ?? []).isNotEmpty
                        ? Image.network(
                            // "https://roadmate.in/admin/public/market/65a4fe7a20cd7.png",
                            AppStrings.imageBucketBaseUrl +
                                (controller.productDetails?.images ?? []).first,
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                            return Text('Your error widget...');
                          })
                        : const SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.productDetails?.productName ?? ""),
                      const Text("*****"),
                    ],
                  ),
                  Text(controller.productDetails?.description ?? ""),
                  Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Exclusive Launch Offer"),
                          Row(
                            children: [
                              Text(
                                  "\$${controller.productDetails?.offerPrice ?? ""}"),
                              Text(
                                "\$${controller.productDetails?.price ?? ""}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      Colors.grey, // Adjust color as needed
                                ),
                              ),
                              Text("${controller.productDetails?.prate}% off"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.local_offer),
                              Text(
                                  "Get Assured ${controller.productDetails?.prate}% cashback on your offer")
                            ],
                          )
                        ]),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on),
                      Text("Test Shop, 34/226, kalamasseri"),
                      Text("Change")
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Available Coupouns"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  Row(
                    children: [
                      CustomButton(
                          title: "Add to Cart",
                          isPrimary: false,
                          onPress: () {
                            controller.addToCart();
                          }),
                      CustomButton(
                          title: "Buy Now", isPrimary: true, onPress: () {}),
                    ],
                  ),
                ]
                    .map((e) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}

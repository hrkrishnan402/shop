import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/common/constants/app_strings.dart';
import 'package:test_app/common/widgets/category_card.dart';
import 'package:test_app/common/widgets/common_appbar.dart';
import 'package:test_app/common/widgets/product_card.dart';
import 'package:test_app/repository/api/api_repository.dart';
import 'package:test_app/views/cart_page/cart_page.dart';
import 'package:test_app/views/catogory_list/category_list_page.dart';
import 'package:test_app/views/home_page/widgets/bookind_offer_card.dart';
import 'package:test_app/views/product_details/product_details.dart';
import 'package:test_app/views/product_page.dart/product_page.dart';

import '../../controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(GetIt.instance.get<ApiRepository>()),
      builder: (controller) => Scaffold(
        appBar: CommonAppBar(
            title: "Good Morning",
            cartCount: controller.cartItemList.length,
            onLeftActionTap: () {},
            onNotificationTap: () {
              Get.to(const CartPage());
            }),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  BookigOfferCard(
                    title: "Booking",
                    icon: Icons.calendar_today,
                    description: "View Bookings",
                  ),
                  BookigOfferCard(
                    title: "Offers",
                    icon: Icons.percent_rounded,
                    description: "View Bookings",
                  )
                ],
              ),
             
              const Text("Product Categories"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (controller.categoryList ?? []).length + 1,
                    itemBuilder: (context, index) => index ==
                            (controller.categoryList ?? []).length
                        ? InkWell(
                            onTap: () => Get.to(const CategoryLisPage()),
                            child: const SizedBox(
                              height: 100,
                              width: 125,
                              child: Center(
                                child: Text("View All"),
                              ),
                            ),
                          )
                        : CategoryCard(
                            onTap: () {},
                            imageUrl:
                                (controller.categoryList ?? [])[index].image,
                            text: (controller.categoryList ?? [])[index]
                                .categoryName)),
              ),
                Row(
                children: [
                  const Text("Featured Products"),
                  InkWell(
                    onTap: () => Get.to(const ProductPage()),
                    child: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
              
              GridView.builder(
                shrinkWrap: true,
                itemCount: (controller.productList ?? []).length,
                itemBuilder: (context, index) => ProductCard(
                    imageURL: AppStrings.imageBucketBaseUrl +
                        (controller.productList ?? [])[index].images,
                    price:
                        (controller.productList ?? [])[index].price.toString(),
                    rating: 2.0,
                    isFavorite: false,
                    onTap: () {
                      Get.to(ProductDetailsPage(
                          productId: (controller.productList ?? [])[index].id));
                    }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

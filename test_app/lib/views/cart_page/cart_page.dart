import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/home_page_controller.dart';
import 'package:test_app/views/cart_page/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Icon(Icons.arrow_forward_ios),
            Expanded(child: Text("My Cart")),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton.extended(
          isExtended: true,
          onPressed: () {},
          label: Text("Place Order"),
        ),
      ),
      body: GetBuilder(
          init: Get.find<HomePageController>(),
          builder: (controller) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    for (int i = 0; i < controller.cartItemList.length; i++)
                      CartCard(
                        title: controller.cartItemList[i].productName,
                        description: controller.cartItemList[i].description,
                        discountPercentage: "10",
                        imageUrl: controller.cartItemList[i].images,
                        offerPrice:
                            controller.cartItemList[i].offerPrice.toString(),
                        originalPrice:
                            controller.cartItemList[i].price.toString(),
                        quantity: controller.cartItemList[i].qty,
                      ),
                    // Expanded(
                    // child: CustomButton(
                    // title: "Place Order", isPrimary: false, onPress: () {}))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

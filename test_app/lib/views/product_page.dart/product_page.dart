import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/views/product_details/product_details.dart';
import 'package:test_app/views/product_page.dart/widgets/horizontal_scroll_list.dart';
import 'package:test_app/views/product_page.dart/widgets/product_grid_view.dart';
import 'package:test_app/views/product_page.dart/widgets/search_box.dart';

import '../../controllers/product_page_controller.dart';
import '../../repository/api/api_repository.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: ProductPageController(GetIt.instance.get<ApiRepository>()),
          builder: (controller) {
            return SingleChildScrollView(
                child: Column(
              children: [
                SearchBox(onChange: (value) {
                  controller.searchProduct(value);
                }),
                HorizontalScrollList(
                    selectedId: controller.selectedCategoryid,
                    categories: controller.categoryList ?? [],
                    onCategorySelected: (id) {
                      controller.onCategorySelected(id);
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Text("All Products"),
                SizedBox(
                  height: 400,
                  child: ProductGridView(
                      productList: controller.productList ?? [],
                      onTap: (id) {
                        Get.to(ProductDetailsPage(productId: id));
                      }),
                )
              ],
            ));
          }),
    );
  }
}

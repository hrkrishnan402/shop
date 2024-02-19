import 'package:flutter/material.dart';
import 'package:test_app/common/widgets/product_card.dart';

import '../../../models/product.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> productList;
  final Function(int) onTap;

  const ProductGridView(
      {super.key, required this.productList, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
            imageURL: productList[index].images,
            price: productList[index].price.toString(),
            rating: productList[index].status.toDouble(),
            isFavorite: false,
            onTap: () {
              onTap.call(productList[index].id);
            });
      },
    );
  }
}

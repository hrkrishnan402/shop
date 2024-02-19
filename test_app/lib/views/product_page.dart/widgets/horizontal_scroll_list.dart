import 'package:flutter/material.dart';
import 'package:test_app/common/widgets/category_card.dart';
import 'package:test_app/models/category.dart';

class HorizontalScrollList extends StatelessWidget {
  final List<Category> categories;
  final int? selectedId;
  final Function(int) onCategorySelected;
  const HorizontalScrollList(
      {super.key,
      required this.categories,
      this.selectedId,
      required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return index == 0
              ? const SizedBox(
                  height: 100,
                  width: 125,
                  child: Center(
                    child: Text("All Categories"),
                  ),
                )
              : CategoryCard(
                  onTap: () =>  onCategorySelected.call(categories[index].id),
                  isSelected: (selectedId ?? 0) == categories[index].id,
                  imageUrl: categories[index].image,
                  text: categories[index].categoryName);
        },
      ),
    );
  }
}

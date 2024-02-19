import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/common/widgets/category_card.dart';
import 'package:test_app/common/widgets/common_appbar.dart';
import 'package:test_app/controllers/category_list_controller.dart';

import '../../repository/api/api_repository.dart';

class CategoryLisPage extends StatelessWidget {
  const CategoryLisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "Category List",
          onLeftActionTap: () {},
          onNotificationTap: () {}),
      body: SingleChildScrollView(
          child: GetBuilder(
              init: CategoryLisPageController(
                  GetIt.instance.get<ApiRepository>()),
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        imageUrl: controller.categoryList[index].image,
                        text: controller.categoryList[index].categoryName,
                        onTap: () {});
                  },
                );
              })),
    );
  }
}

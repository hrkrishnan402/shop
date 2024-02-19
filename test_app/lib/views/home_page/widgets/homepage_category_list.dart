import 'package:flutter/material.dart';
import 'package:test_app/common/constants/app_strings.dart';


class HomePageCategoryList extends StatelessWidget {
  const HomePageCategoryList(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          children: [Image.network(AppStrings.imageBucketBaseUrl + imageUrl), Text(title)],
        ),
      ),
    );
  }
}

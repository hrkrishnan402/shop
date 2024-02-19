import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool? isSelected;
  final Function() onTap;

  const CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.text,
    this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        width: 125,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                AppStrings.imageBucketBaseUrl + imageUrl,
                height: 20.0,
                fit: BoxFit.fill,
                color: returnColor(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 12.0,
                    color: returnColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  returnColor () => (isSelected ?? false) ? Colors.red : Colors.black;
}

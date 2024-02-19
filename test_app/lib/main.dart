import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/network/http_handler.dart';
import 'package:test_app/repository/api/api_repository.dart';
import 'package:test_app/views/home_page/homepage.dart';

import 'views/catogory_list/category_list_page.dart';
import 'views/product_page.dart/product_page.dart';

void serviceLocatorInitialisation() {
  GetIt serviceLocator = GetIt.I;
  serviceLocator.registerSingleton(ApiRepository(HttpHandler(Dio())));
}

void main() {
  serviceLocatorInitialisation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

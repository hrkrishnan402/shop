import 'package:get/get.dart';

import '../common/constants/app_strings.dart';
import '../models/category.dart';
import '../repository/api/api_repository.dart';

class CategoryLisPageController extends GetxController {
  ApiRepository _apiRepository;
  CategoryLisPageController(this._apiRepository);
  List<Category> categoryList = [];
  @override
  void onInit() async {
    categoryList = await _apiRepository.getCategory(AppStrings.getCategoryList);
    update();
    super.onInit();
  }
}

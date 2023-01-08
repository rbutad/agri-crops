import 'package:agricrops/models/category/category.dart';
import 'package:agricrops/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  CategoryProvider(this._categoryService);

  Stream<List<Category>> getCategories() {
    return _categoryService
        .getCategories()
        .map((list) => _categories = [...list]);
  }

  Future<List<Category>> searchCategory({required String categoryQuery}) async {
    return await _categoryService.searchCategory(categoryQuery: categoryQuery);
  }
}

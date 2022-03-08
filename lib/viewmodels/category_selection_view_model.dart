import 'package:flutter/widgets.dart';

enum Category { favourites, kitchen, livingroom, bedroom }

extension CategoryExtension on Category {
  String get text {
    switch (this) {
      case Category.bedroom:
        return 'Bedroom';
      case Category.favourites:
        return 'Favourites';
      case Category.livingroom:
        return 'Living Room';
      case Category.kitchen:
        return 'Kitchen';
    }
  }
}

class CategorySelectionViewModel extends ChangeNotifier {
  Category _selectedCategory = Category.kitchen;

  Category get selectedCategory => _selectedCategory;
  void onSelectedCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<Category> categoryList = [
    Category.favourites,
    Category.kitchen,
    Category.livingroom,
    Category.bedroom,
  ];
}

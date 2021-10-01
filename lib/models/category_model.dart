import 'package:flutter/material.dart';

class CategoriesItem{
  final String imageName;
  final String categoryName;
  final VoidCallback? yourNavigation;

  CategoriesItem(this.imageName, this.categoryName, this.yourNavigation);
}
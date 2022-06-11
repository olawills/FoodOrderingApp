import 'dart:ui';

import 'package:palmo/models/sub_category.dart';

class Category {
  String name;
  String icon;
  Color colour;
  String imgName;
  List<SubCategory>? subCategories;

  Category({
    required this.name,
    required this.icon,
    required this.colour,
    required this.imgName,
    this.subCategories,
  });
}

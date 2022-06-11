import 'package:palmo/models/category.dart';
import 'dart:ui';

import 'package:palmo/models/category_part.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;

  SubCategory(
      {required this.parts,
      required String name,
      required String icon,
      required Color colour,
      required String imgName})
      : super(name: name, icon: icon, colour: colour, imgName: imgName);
}

import 'package:flutter/material.dart';
import 'package:palmo/widgets/icon_font.dart';

class CategoryIcon extends StatelessWidget {
  final Color colour;
  final String iconName;
  final double size;
  final double padding;

  const CategoryIcon(
      {Key? key,
      required this.colour,
      required this.iconName,
      this.size = 30,
      this.padding = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: colour,
        padding: EdgeInsets.all(padding),
        child: IconFont(
          colour: Colors.white,
          iconName: iconName,
          size: size,
        ),
      ),
    );
  }
}

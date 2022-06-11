import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  final Color colour;
  final double size;
  final String iconName;
  const IconFont(
      {Key? key,
      required this.colour,
      required this.size,
      required this.iconName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      iconName,
      style: TextStyle(
        color: colour,
        fontSize: size,
        fontFamily: 'orilla',
      ),
    );
  }
}

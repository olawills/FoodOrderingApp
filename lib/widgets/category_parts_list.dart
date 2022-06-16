// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:palmo/models/category_part.dart';
import 'package:palmo/models/sub_category.dart';

class CategoryPartsList extends StatefulWidget {
  final SubCategory subCategory;
  const CategoryPartsList({Key? key, required this.subCategory})
      : super(key: key);

  @override
  State<CategoryPartsList> createState() => _CategoryPartsListState();
}

class _CategoryPartsListState extends State<CategoryPartsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
          // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            'Select the part you want',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.subCategory.parts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Highlight
                  setState(() {
                    widget.subCategory.parts.forEach((CategoryPart part) {
                      part.isSelected = widget.subCategory.parts[index] == part;
                    });
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: 120,
                      height: 130,
                      decoration: BoxDecoration(
                        border: widget.subCategory.parts[index].isSelected!
                            ? Border.all(
                                color: widget.subCategory.colour,
                                width: 7,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/' +
                                widget.subCategory.parts[index].imgName +
                                '.png',
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset.zero,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: Text(
                        widget.subCategory.parts[index].name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: widget.subCategory.colour,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

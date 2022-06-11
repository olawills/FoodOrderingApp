// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:palmo/helpers/category_icon.dart';
import 'package:palmo/models/category.dart';
import 'package:palmo/screens/details_page.dart';
import 'package:palmo/widgets/main_app_bar.dart';

class SelectedCategoryPage extends StatelessWidget {
  final Category selectedCategory;
  const SelectedCategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  colour: selectedCategory.colour,
                  iconName: selectedCategory.icon,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  selectedCategory.name,
                  style: TextStyle(
                    color: selectedCategory.colour,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  selectedCategory.subCategories!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            subCategory: selectedCategory.subCategories![index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/' +
                                  selectedCategory
                                      .subCategories![index].imgName +
                                  '.png',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            selectedCategory.subCategories![index].name,
                            style: TextStyle(
                              color: selectedCategory.colour,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

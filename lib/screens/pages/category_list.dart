// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:palmo/models/category.dart';
import 'package:palmo/helpers/utils.dart';
import 'package:palmo/screens/pages/category_card.dart';
import 'package:palmo/screens/pages/selected_category_page.dart';
import 'package:palmo/widgets/bottom_bar_card.dart';
import 'package:palmo/widgets/main_app_bar.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class CategoryListPage extends StatelessWidget {
  // const CategoryListPage({Key? key}) : super(key: key);
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: const MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'Select any Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 120),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryCard(
                        category: categories[index],
                        onCardClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedCategoryPage(
                                selectedCategory: categories[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomBarCard(),
            ),
          ],
        ),
      ),
    );
  }
}

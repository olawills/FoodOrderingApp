// ignore_for_file: must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/helpers/category_icon.dart';
import 'package:palmo/models/sub_category.dart';
import 'package:palmo/widgets/category_parts_list.dart';
import 'package:palmo/widgets/main_app_bar.dart';
import 'package:palmo/widgets/theme_button.dart';
import 'package:palmo/widgets/unit_price.dart';
import 'package:palmo/screens/pages/map_page.dart';

class DetailsPage extends StatefulWidget {
  int amount = 0;
  final double price = 1200.0;
  double cost = 0.0;
  final SubCategory subCategory;
  DetailsPage({Key? key, required this.subCategory}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/' +
                              widget.subCategory.imgName +
                              '_desc.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            colour: widget.subCategory.colour,
                            iconName: widget.subCategory.icon,
                            size: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: widget.subCategory.colour,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text(
                                  '₦1200.00 / lb',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 100,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 15,
                        right: 15,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20,
                            offset: Offset.zero,
                          )
                        ],
                      ),
                      child: Row(
                        children: const [
                          Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  const MainAppBar(
                    themeColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryPartsList(
                      subCategory: widget.subCategory,
                    ),
                    UnitPriceWidget(),
                    ThemeButton(
                      label: 'Continue to Cart',
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onClick: () {},
                    ),
                    ThemeButton(
                      label: 'Location of Product',
                      icon: const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      color: AppColors.darkGreen,
                      highlight: AppColors.darkerGreen,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

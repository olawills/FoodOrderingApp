import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/helpers/category_icon.dart';
import 'package:palmo/helpers/iconHelper.dart';

class MapBottomPill extends StatelessWidget {
  const MapBottomPill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/cat1_1.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        colour: AppColors.meats,
                        iconName: IconFontHelper.meats,
                        size: 20,
                        padding: 5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meat Buyer',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text('5 Ohuntan Street'),
                      const Text(
                        '2km of distance',
                        style: TextStyle(
                          color: AppColors.meats,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.location_pin,
                  color: AppColors.meats,
                  size: 50,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/farmer.jpeg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: AppColors.meats,
                          width: 4,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Able God Ventures',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Best and Affordable products'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

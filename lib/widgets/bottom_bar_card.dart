import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';

class BottomBarCard extends StatelessWidget {
  const BottomBarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero,
          )
        ],
      ),
      height: 100,
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: AppColors.mainColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(
                  Icons.pin_drop,
                  color: AppColors.mainColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.mainColor,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

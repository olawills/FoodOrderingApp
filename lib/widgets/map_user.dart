import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';

class MapUser extends StatelessWidget {
  final bool isSelected;

  const MapUser({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainColor : Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage('assets/images/me.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: isSelected ? AppColors.mainColor : AppColors.mainColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olawills',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isSelected ? AppColors.mainColor : Colors.grey,
                  ),
                ),
                Text(
                  'My Location',
                  style: TextStyle(
                    color:
                        isSelected ? AppColors.mainColor : AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.location_pin,
            color: isSelected ? Colors.white : AppColors.mainColor,
            size: 40,
          ),
        ],
      ),
    );
  }
}

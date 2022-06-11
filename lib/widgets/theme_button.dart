// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';

class ThemeButton extends StatelessWidget {
  String? label;
  Function onClick;
  Color color;
  Color highlight;
  Widget? icon;
  Color borderColor;
  Color labelColor;
  double borderWidth;

  ThemeButton(
      {Key? key,
      this.label,
      this.labelColor = Colors.white,
      this.color = AppColors.mainColor,
      this.highlight = AppColors.highlightDefault,
      this.icon,
      this.borderColor = Colors.transparent,
      this.borderWidth = 3,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: color,
          child: InkWell(
            splashColor: highlight.withOpacity(0.2),
            highlightColor: highlight.withOpacity(0.2),
            onTap: () {
              onClick();
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                border: Border.all(
                  color: AppColors.mainColor,
                  width: 4,
                ),
              ),
              child: icon == null
                  ? Text(
                      label!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: labelColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        const SizedBox(width: 10),
                        Text(
                          label!,
                          style: TextStyle(
                            fontSize: 16,
                            color: labelColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}





// Container(
//             margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Material(
//                 color: AppColors.darkGreen,
//                 child: InkWell(
//                   splashColor: AppColors.darkGreen.withOpacity(0.2),
//                   highlightColor: AppColors.mainColor.withOpacity(0.2),
//                   onTap: () {},
//                   child: Container(
//                     padding: const EdgeInsets.all(15),
//                     child: const Text(
//                       'Location',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.transparent,
//                       border: Border.all(
//                         color: AppColors.darkGreen,
//                         width: 3,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],

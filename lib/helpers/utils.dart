import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/models/category.dart';
import 'package:palmo/helpers/iconHelper.dart';
import 'package:palmo/models/category_part.dart';
import 'package:palmo/models/onBoarding_content.dart';
import 'package:palmo/models/sub_category.dart';

class Utils {
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
        message:
            'Best, rich and affordable foods, pastries\n, African cruisines all in one app',
        img: 'onboard1',
      ),
      OnboardingContent(
        message: 'Best and absolute free delivery',
        img: 'onboard2',
      ),
      OnboardingContent(
        message: 'Tasty and Delicious meals all in one combination',
        img: 'onboard3',
      )
    ];
  }

  static List<Category> getMockedCategories() {
    return [
      Category(
        name: 'Meats',
        icon: IconFontHelper.meats,
        colour: AppColors.meats,
        imgName: 'cat1',
        subCategories: [
          SubCategory(
            name: 'Pig',
            imgName: 'cat1_1',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [
              CategoryPart(
                imgName: 'cat1_1_p1',
                name: 'Pork meat',
                isSelected: false,
              ),
              CategoryPart(
                imgName: 'cat1_1_p2',
                name: 'Pork leg',
                isSelected: false,
              ),
              CategoryPart(
                imgName: 'cat1_1_p3',
                name: 'Pork ribs',
                isSelected: false,
              ),
              CategoryPart(
                imgName: 'cat1_1_p4',
                name: 'Pork skin',
                isSelected: false,
              ),
              CategoryPart(
                imgName: 'cat1_1_p5',
                name: 'Pork liver',
                isSelected: false,
              ),
              CategoryPart(
                imgName: 'cat1_1_p6',
                name: 'Pork back',
                isSelected: false,
              ),
            ],
          ),
          SubCategory(
            name: 'Fowl',
            imgName: 'cat1_2',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [],
          ),
          SubCategory(
            name: 'Cow',
            imgName: 'cat1_3',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [],
          ),
          SubCategory(
            name: 'Peacock',
            imgName: 'cat1_4',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [],
          ),
          SubCategory(
            name: 'Goat',
            imgName: 'cat1_5',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [],
          ),
          SubCategory(
            name: 'Rabbit',
            imgName: 'cat1_6',
            icon: IconFontHelper.meats,
            colour: AppColors.meats,
            parts: [],
          ),
        ],
      ),
      Category(
        name: 'Fruits',
        icon: IconFontHelper.fruits,
        colour: AppColors.fruits,
        imgName: 'cat2_1',
        subCategories: [],
      ),
      Category(
        name: 'Vegetables',
        icon: IconFontHelper.vegs,
        colour: AppColors.vegs,
        imgName: 'cat3',
        subCategories: [],
      ),
      Category(
        name: 'Seeds',
        icon: IconFontHelper.seeds,
        colour: AppColors.seeds,
        imgName: 'cat4',
        subCategories: [],
      ),
      Category(
        name: 'Patries',
        icon: IconFontHelper.pastries,
        colour: AppColors.pastries,
        imgName: 'cat5',
        subCategories: [],
      ),
      Category(
        name: 'Spices',
        icon: IconFontHelper.spices,
        colour: AppColors.spices,
        imgName: 'cat6',
        subCategories: [],
      ),
    ];
  }
}

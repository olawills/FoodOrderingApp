import 'package:flutter/material.dart';
import 'package:palmo/helpers/iconHelper.dart';
import 'package:palmo/screens/onBoarding_screen.dart';
import 'package:palmo/widgets/icon_font.dart';
import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/screens/pages/category_list.dart';
import 'package:palmo/widgets/theme_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/mainBg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: AppColors.mainColor,
                        alignment: Alignment.center,
                        child: const IconFont(
                          colour: Colors.white,
                          size: 130,
                          iconName: IconFontHelper.mainlogo,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Olawills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Best Place to get good\nand affordable foods and order on time\n@Olawills',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ThemeButton(
                    label: 'Sign Up',
                    highlight: Colors.green,
                    color: AppColors.mainColor,
                    onClick: () {},
                  ),
                  ThemeButton(
                    label: 'Know more about our App',
                    highlight: Colors.green,
                    color: AppColors.darkGreen,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardingScreen()),
                      );
                    },
                  ),
                  ThemeButton(
                    label: 'Google Login',
                    labelColor: AppColors.mainColor,
                    color: Colors.transparent,
                    highlight: AppColors.mainColor.withOpacity(0.5),
                    borderColor: AppColors.mainColor,
                    borderWidth: 3,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

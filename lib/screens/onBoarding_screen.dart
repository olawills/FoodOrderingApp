// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/helpers/iconHelper.dart';
import 'package:palmo/helpers/utils.dart';
import 'package:palmo/models/onBoarding_content.dart';
import 'package:palmo/screens/pages/category_list.dart';
import 'package:palmo/widgets/icon_font.dart';
import 'package:palmo/widgets/main_app_bar.dart';
import 'package:palmo/widgets/theme_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnboardingContent> _content = Utils.getOnboarding();
  int pageIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    pageIndex = page;
                  });
                },
                children: List.generate(
                  _content.length,
                  (index) => Container(
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.only(
                        left: 40, right: 40, top: 40, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainColor.withOpacity(0.3),
                          blurRadius: 20,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: IconFont(
                                  colour: AppColors.mainColor,
                                  iconName: IconFontHelper.logo,
                                  size: 40,
                                ),
                              ),
                              Image.asset(
                                  'assets/images/${_content[index].img}.png'),
                              const SizedBox(height: 40),
                              Text(
                                _content[index].message!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: index == _content.length - 1,
                          child: ThemeButton(
                            label: 'Enter Content',
                            color: AppColors.darkGreen,
                            highlight: AppColors.darkerGreen,
                            onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryListPage()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _content.length,
                (index) => GestureDetector(
                  onTap: () {
                    _controller!.animateTo(
                      MediaQuery.of(context).size.width * index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 6,
                        color: pageIndex == index
                            ? const Color(0XFFC1E09E)
                            : Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ThemeButton(
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListPage()),
                );
              },
              label: 'Start Onboarding',
            )
          ],
        ),
      ),
    );
  }
}

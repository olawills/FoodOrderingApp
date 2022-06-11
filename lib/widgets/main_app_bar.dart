import 'package:flutter/material.dart';
import 'package:palmo/helpers/app_colors.dart';
import 'package:palmo/helpers/iconHelper.dart';
import 'package:palmo/widgets/icon_font.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.themeColor = AppColors.mainColor,
    this.showProfilePic = true,
  }) : super(key: key);
  final Color themeColor;
  final bool showProfilePic;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: IconFont(
        iconName: IconFontHelper.logo,
        colour: widget.themeColor,
        size: 40,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: AppColors.mainColor,
      ),
      actions: [
        Opacity(
          opacity: widget.showProfilePic ? 1 : 0,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset(
                'assets/images/me.jpg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:palmo/helpers/iconHelper.dart';
import 'package:palmo/widgets/icon_font.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key, required this.duration, required this.gotoPage})
      : super(key: key);
  final int duration;
  final Widget gotoPage;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => gotoPage));
    });
    return Scaffold(
      body: Container(
        color: const Color(0xff80c038),
        alignment: Alignment.center,
        child: const IconFont(
          colour: Colors.white,
          iconName: IconFontHelper.logo,
          size: 100,
        ),
      ),
    );
  }
}

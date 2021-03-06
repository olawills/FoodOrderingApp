import 'package:flutter/material.dart';
import 'package:palmo/screens/welcome_page.dart';
import 'package:palmo/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(
        duration: 3,
        gotoPage: WelcomePage(),
      ),
    ),
  );
}

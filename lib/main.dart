import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:translator_app/about.dart';

import 'package:translator_app/btmbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        speed: 0,
        duration: 7000,
        navigateRoute: const BtmMainpage(),
        imageSize: 500,
        imageSrc: "assets/splashh.gif",
        backgroundColor: const Color(0xffffffff),
      ),
    );
  }
}

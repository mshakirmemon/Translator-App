// ignore: avoid_web_libraries_in_flutter

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:translator_app/home.dart';

void main() {
runApp(MyApp());

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
        home: Scaffold(
            // appBar: AppBar(
            //   title: Center(child: const Text("Google Translator App")),
            // ),
            body: MyHomePage()));
  }
}

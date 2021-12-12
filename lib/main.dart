import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:untitled/constant.dart';

import 'views/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.topLevel,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: primaryColor,
          ),
          primaryColor: primaryColor),
      home: const HomeScreen(),
    );
  }
}

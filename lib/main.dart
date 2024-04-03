import 'package:flutter/material.dart';
import 'package:flutter_plant_shop/constant.dart';
import 'package:flutter_plant_shop/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop UI',
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

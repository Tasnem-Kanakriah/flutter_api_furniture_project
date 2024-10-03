import 'package:flutter/material.dart';
import 'package:furniture/pages/basic_interface.dart';
import 'package:furniture/pages/bottom_navigation_bar.dart';
import 'package:furniture/pages/onboarding.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          children: const [
            BasicInterface(),
            OnBardingPage(),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}

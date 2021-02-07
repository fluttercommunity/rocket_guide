import 'package:flutter/material.dart';
import 'package:rocket_guide/app/theme.dart';
import 'package:rocket_guide/home/home_screen.dart';

class RocketGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomeScreen(),
    );
  }
}

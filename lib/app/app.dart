import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket_guide/app/theme.dart';
import 'package:rocket_guide/backend/backend.dart';
import 'package:rocket_guide/home/home_screen.dart';

class RocketGuideApp extends StatelessWidget {
  const RocketGuideApp({
    @required this.backend,
  }) : assert(backend != null);

  final Backend backend;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: Provider.value(
        value: backend,
        child: HomeScreen(),
      ),
    );
  }
}

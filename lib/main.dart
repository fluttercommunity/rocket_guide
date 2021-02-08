import 'package:flutter/material.dart';
import 'package:rocket_guide/app/app.dart';
import 'package:rocket_guide/backend/backend.dart';

void main() {
  final backend = Backend('https://api.spacexdata.com/v4');

  runApp(
    RocketGuideApp(
      backend: backend,
    ),
  );
}

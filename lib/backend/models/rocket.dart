import 'package:flutter/material.dart';

class Rocket {
  const Rocket({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.active,
    @required this.boosters,
    @required this.flickrImages,
  });

  final String id;
  final String name;
  final String description;
  final bool active;
  final int boosters;
  final List<String> flickrImages;
}

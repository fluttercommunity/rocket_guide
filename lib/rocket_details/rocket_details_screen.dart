import 'package:flutter/material.dart';
import 'package:rocket_guide/backend/backend.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    Key key,
    @required this.rocket,
  })  : assert(rocket != null),
        super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name),
      ),
      body: ListView(
        children: [
          if (rocket.flickrImages.isNotEmpty) _ImageHeader(rocket: rocket),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rocket.name,
                  style: textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  rocket.description,
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    Key key,
    @required this.rocket,
  }) : super(key: key);

  final Rocket rocket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'hero-${rocket.id}-image',
        child: PageView(
          children: [
            for (final url in rocket.flickrImages)
              Image.network(
                url,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}

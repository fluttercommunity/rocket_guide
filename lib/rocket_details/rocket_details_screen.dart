import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:rocket_guide/backend/backend.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({
    Key key,
    @required this.rocket,
  })  : assert(rocket != null),
        super(key: key);

  final Rocket rocket;

  bool get _hasAlreadyFlown => rocket.firstFlight.isBefore(DateTime.now());

  int get _daysSinceFirstFlight =>
      rocket.firstFlight.difference(DateTime.now()).abs().inDays;

  String get _firstFlightLabel {
    final date = rocket.firstFlight;

    return '${date.year}-${date.month}-${date.day}';
  }

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
          ListTile(
            title: Text(
              rocket.name,
              style: textTheme.headline6,
            ),
            subtitle: rocket.active ? null : Text('Inactive'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              rocket.description,
              style: textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const Icon(AntIcons.calendar),
            title: Text(
              _hasAlreadyFlown
                  ? '$_daysSinceFirstFlight days since first flight'
                  : '$_daysSinceFirstFlight days until first flight',
            ),
            subtitle: Text(
              _hasAlreadyFlown
                  ? 'First flew on $_firstFlightLabel'
                  : 'Scheduled to fly on $_firstFlightLabel',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.column_width),
            title: Text('${rocket.diameter} m'),
            subtitle: const Text('in diameter'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.colum_height),
            title: Text('${rocket.height} m'),
            subtitle: const Text('in height'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(AntIcons.arrow_down),
            title: Text('${rocket.mass} kg'),
            subtitle: Text('total mass'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 56.0,
              child: ElevatedButton(
                onPressed: () {
                  launch(rocket.wikipedia);
                },
                child: Center(
                  child: Text('View Wikipedia Article'),
                ),
              ),
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

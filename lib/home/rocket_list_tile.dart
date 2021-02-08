import 'package:flutter/material.dart';
import 'package:rocket_guide/backend/backend.dart';

class RocketListTile extends StatelessWidget {
  const RocketListTile({
    Key key,
    @required this.rocket,
    @required this.onTap,
  })  : assert(rocket != null),
        super(key: key);

  final Rocket rocket;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      leading: rocket.flickrImages.isEmpty
          ? null
          : Hero(
              tag: 'hero-${rocket.id}-image',
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.network(
                    rocket.flickrImages.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
      title: Hero(
        tag: 'hero-${rocket.id}-name',
        child: Text(rocket.name),
      ),
      subtitle: Text(
        rocket.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_sharp),
    );
  }
}

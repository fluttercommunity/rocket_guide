import 'package:meta/meta.dart';

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Rocket>> getRockets() async {
    final url = '$hostUrl/rockets';

    // TODO: Remove the "return " line below and add an API call here
    // that uses the url above to fetch all rockets!

    return const [
      Rocket(
        id: 'flacon_1',
        name: 'Falcon 1',
        description: 'The Falcon 1 was an expendable launch system privately '
            'developed and manufactured by SpaceX during 2006-2009. '
            'On 28 September 2008, Falcon 1 became the first '
            'privately-developed liquid-fuel launch vehicle to go into orbit '
            'around the Earth.',
        active: false,
        boosters: 0,
        flickrImages: [
          'https://imgur.com/DaCfMsj.jpg',
          'https://imgur.com/azYafd8.jpg',
        ],
      ),
      Rocket(
        id: 'falcon_heavy',
        name: 'Falcon Heavy',
        description: 'With the ability to lift into orbit over 54 metric tons '
            '(119,000 lb)--a mass equivalent to a 737 jetliner loaded with '
            'passengers, crew, luggage and fuel--Falcon Heavy can lift more '
            'than twice the payload of the next closest operational vehicle, '
            'the Delta IV Heavy, at one-third the cost.',
        active: true,
        boosters: 2,
        flickrImages: [
          'https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg',
          'https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg',
          'https://farm5.staticflickr.com/4696/40126460511_b15bf84c85_b.jpg',
          'https://farm5.staticflickr.com/4711/40126461411_aabc643fd8_b.jpg',
        ],
      ),
    ];
  }
}

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

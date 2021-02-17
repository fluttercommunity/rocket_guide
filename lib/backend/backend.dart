import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Rocket>> getRockets() async {
    final url = '$hostUrl/rockets';

    // Fetch the data from the API.
    // Since `http.get` returns a `Future`, we need to use `await` here.
    final response = await http.get(url);

    // If the request failed, we throw an exception.
    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    // Get the JSON data from the response.
    final body = response.body;

    // Convert the body, a String, into a JSON object.
    // To do this, use Dart's built-in JSON decoder.
    // We know this returns a `List`, so we type-cast it into a `List<dynamic>`.
    final jsonData = json.decode(body) as List;

    // Convert every item in the list into a `Rocket`.
    final rockets =
        jsonData.map((jsonObject) => Rocket.fromJson(jsonObject)).toList();

    return rockets;
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
    @required this.firstFlight,
    @required this.height,
    @required this.diameter,
    @required this.mass,
    @required this.wikipedia,
  });

  final String id;
  final String name;
  final String description;
  final bool active;
  final int boosters;
  final List<String> flickrImages;
  final DateTime firstFlight;
  final double height;
  final double diameter;
  final double mass;
  final String wikipedia;

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      active: json['active'],
      boosters: json['boosters'],
      flickrImages: List<String>.from(json['flickr_images']),
      firstFlight: DateTime.parse(json['first_flight']),
      height: (json['height']['meters'] as num).toDouble(),
      diameter: (json['diameter']['meters'] as num).toDouble(),
      mass: (json['mass']['kg'] as num).toDouble(),
      wikipedia: json['wikipedia'],
    );
  }
}

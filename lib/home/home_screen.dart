import 'package:flutter/material.dart';
import 'package:rocket_guide/backend/backend.dart';
import 'package:rocket_guide/home/rocket_list_tile.dart';
import 'package:rocket_guide/rocket_details/rocket_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Guide'),
      ),
      body: FutureBuilder(
        future: context.read<Backend>().getRockets(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred.'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final rockets = snapshot.data;

            return ListView(
              children: [
                for (final rocket in rockets) ...[
                  RocketListTile(
                    rocket: rocket,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RocketDetailsScreen(rocket: rocket);
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(height: 0.0),
                ]
              ],
            );
          }
        },
      ),
    );
  }
}

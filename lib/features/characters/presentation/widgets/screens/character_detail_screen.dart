import 'package:flutter/material.dart';

import '../../../domain/models/rick_and_morty_response.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${character.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Species: ${character.species}'),
            const SizedBox(height: 8),
            Text('Status: ${character.status}'),
            const SizedBox(height: 8),
            Text('Gender: ${character.gender}'),
            const SizedBox(height: 8),
            Text('Origin: ${character.origin.name}'),
            const SizedBox(height: 8),
            Text('Location: ${character.location.name}'),
          ],
        ),
      ),
    );
  }
}

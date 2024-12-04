import 'package:flutter/material.dart';
import 'package:tabit/features/characters/domain/models/rick_and_morty_response.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Character Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                character.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Character Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Species: ${character.species}'),
                  Text('Status: ${character.status}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

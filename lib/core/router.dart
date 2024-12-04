import 'package:go_router/go_router.dart';
import 'package:tabit/features/characters/domain/models/rick_and_morty_response.dart';
import 'package:tabit/features/characters/presentation/widgets/screens/all_characters_screen.dart';

import '../features/characters/presentation/widgets/screens/character_detail_screen.dart';

const String allCharactersScreenPath = "/";
const String characterDetailPath = "/character_detail";
final router = GoRouter(initialLocation: allCharactersScreenPath, routes: [
  GoRoute(
    path: allCharactersScreenPath,
    builder: (context, state) => const AllCharactersScreen(),
  ),
  GoRoute(
    path: characterDetailPath,
    builder: (context, state) {
      Character character = state.extra as Character;
      return CharacterDetailScreen(character: character);
    },
  ),
]);

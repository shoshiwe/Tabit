import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tabit/core/api_service.dart';
import 'package:tabit/features/characters/domain/models/rick_and_morty_response.dart';

import '../../data/characters_service.dart';

part 'characters_providers.g.dart';

@riverpod
ApiService apiService(ref) => ApiService();

@riverpod
CharactersService charactersService(ref) =>
    CharactersService(apiService: ref.read(apiServiceProvider));

@riverpod
Future<RickAndMortyResponse> getCharactersInPage(ref, String page) {
  CharactersService charactersService = ref.read(charactersServiceProvider);
  return charactersService.getCharactersByPage(page);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabit/core/api_service.dart';
import 'package:tabit/features/characters/data/characters_service.dart';
import 'package:tabit/features/characters/domain/models/rick_and_morty_response.dart';
import 'package:tabit/features/characters/domain/utils/characters_constants.dart';
import 'package:tabit/features/characters/presentation/providers/updated_characters.dart';

void main() {
  late ProviderContainer container;
  late UpdatedCharacters updatedCharacters;
  late CharactersService charactersService;

  setUp(() {
    container = ProviderContainer();
    updatedCharacters = container.read(updatedCharactersProvider.notifier);
    charactersService = CharactersService(apiService: ApiService());

    // Populate initial characters for testing
    updatedCharacters.allCharacters = [
      Character(
        name: 'Rick Sanchez',
        status: 'Alive',
        id: 1,
        species: '',
        type: "",
        gender: "",
        origin: Origin(name: "name", url: "url"),
        location: Location(name: "name", url: "url"),
        image: "",
        episode: [],
        url: "",
        created: "",
      ),
      Character(
          name: 'Morty Smith',
          status: 'Alive',
          id: 2,
          species: '',
          type: "",
          gender: "",
          origin: Origin(name: "name", url: "url"),
          location: Location(name: "name", url: "url"),
          image: "",
          episode: [],
          url: "",
          created: ""),
      Character(
          name: 'Birdperson',
          status: 'Dead',
          id: 3,
          species: '',
          type: "",
          gender: "",
          origin: Origin(name: "name", url: "url"),
          location: Location(name: "name", url: "url"),
          image: "",
          episode: [],
          url: "",
          created: ""),
    ];
  });

  tearDown(() {
    container.dispose();
  });

  test('filters characters by status', () {
    updatedCharacters.filterOrSearchCharacters(CharacterStatus.alive, '');
    final characterNames =
        updatedCharacters.state.value?.map((c) => c.name).toList();
    expect(characterNames, ['Rick Sanchez', 'Morty Smith']);
  });

  test('searches characters by name', () {
    updatedCharacters.filterOrSearchCharacters(null, 'Rick');
    final characterNames =
        updatedCharacters.state.value?.map((c) => c.name).toList();
    expect(characterNames, ['Rick Sanchez']);
  });

  test('filters and searches characters by status and name', () {
    updatedCharacters.filterOrSearchCharacters(CharacterStatus.alive, 'Morty');
    final characterNames =
        updatedCharacters.state.value?.map((c) => c.name).toList();
    expect(characterNames, ['Morty Smith']);
  });

  test('returns all characters when no filter or search applied', () {
    updatedCharacters.filterOrSearchCharacters(null, '');
    final characterNames =
        updatedCharacters.state.value?.map((c) => c.name).toList();
    expect(characterNames, ['Rick Sanchez', 'Morty Smith', 'Birdperson']);
  });

  test('get characters from server', () async {
    var response = await charactersService.getCharactersByPage(charactersApi);
    expect(response.results, isNotEmpty);
  });
}

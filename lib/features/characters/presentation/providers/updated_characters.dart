import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tabit/features/characters/domain/models/rick_and_morty_response.dart';
import 'package:tabit/features/characters/domain/utils/characters_constants.dart';
import 'package:tabit/features/characters/presentation/providers/characters_providers.dart';

part 'updated_characters.g.dart';

@riverpod
class UpdatedCharacters extends _$UpdatedCharacters {
  List<Character> allCharacters = [];
  CharacterStatus? filterByStatus;
  String searchText = "";
  String? currentPage = charactersApi;
  bool inProgress = false;
  bool isSearching = false;

  @override
  AsyncValue<List<Character>> build() {
    state = const AsyncLoading();
    getCharactersByPage();
    return state;
  }

  Future<void> getCharactersByPage() async {
    if (currentPage != null && !inProgress) {
      inProgress = true;
      try {
        final response =
            await ref.read(getCharactersInPageProvider(currentPage!).future);
        currentPage = response.info.next;
        var list = response.results;
        allCharacters.addAll(list);

        if (filterByStatus != null) {
          list = filterCharactersByStatus(list, filterByStatus!);
        }
        if (searchText.isNotEmpty) {
          list = searchCharactersByName(list, searchText);
        }

        state = AsyncData([...state.valueOrNull ?? [], ...list]);
      } catch (error, stackTrace) {
        state = AsyncError(error, stackTrace);
      } finally {
        inProgress = false;
      }
    }
  }

  void filterOrSearchCharacters(CharacterStatus? status, String text) {
    filterByStatus = status;
    searchText = text;
    isSearching = text.isNotEmpty;

    final filteredList = _applyFiltersAndSearch();
    state = AsyncData(filteredList);
  }

  List<Character> _applyFiltersAndSearch() {
    var filteredList = allCharacters;
    if (filterByStatus != null) {
      filteredList = filterCharactersByStatus(filteredList, filterByStatus!);
    }
    if (searchText.isNotEmpty) {
      filteredList = searchCharactersByName(filteredList, searchText);
    }
    return filteredList;
  }

  List<Character> filterCharactersByStatus(
      List<Character> characters, CharacterStatus status) {
    return characters
        .where((character) =>
            character.status.toLowerCase() == status.name.toLowerCase())
        .toList();
  }

  List<Character> searchCharactersByName(
      List<Character> characters, String text) {
    return characters
        .where((character) =>
            character.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}

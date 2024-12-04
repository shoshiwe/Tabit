import 'package:tabit/core/api_service.dart';

import '../domain/models/rick_and_morty_response.dart';

class CharactersService {
  final ApiService _apiService;

  CharactersService({required ApiService apiService})
      : _apiService = apiService;

  Future<RickAndMortyResponse> getCharactersByPage(page) async {
    try {
      var response = await _apiService.get(page, "load characters");
      return RickAndMortyResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

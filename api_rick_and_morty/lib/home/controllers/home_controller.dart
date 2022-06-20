import 'package:api_rick_and_morty/home/models/character.dart';
import 'package:api_rick_and_morty/home/repositories/home_repositories.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomeController {
  final homeApiRepository = HomeRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    final Response response = await homeApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map datafromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = datafromAPI["results"];

      characters = charactersResults
          .map((character) => CharacterDTO.fromJson(character))
          .toList();
    }
    return characters;
  }
}

final homeController = HomeController();

import 'package:logger/logger.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokeAPIService {
  var logger = Logger();

  Future<List<Pokemon>> getPokemons() async {
    logger.d("Retrieving information from PokeAPI");

    List<Pokemon> pokemons = [];

    try {
      pokemons =  await PokeAPI.getObjectList(PokeConstants.retrieveOffset,PokeConstants.retrieveLimit);
      return pokemons;
    } catch (e) {
      logger.d(e.toString());
    }

    return pokemons;
  }

  Future<Pokemon> getPokemon(pokemonId) async {
    logger.d("Retrieving information from PokeAPI for $pokemonId");

    Pokemon pokemon;

    try {
      pokemon =  await PokeAPI.getObject(pokemonId);
      return pokemon;
    } catch (e) {
      logger.d(e.toString());
    }

    return pokemon;
  }


}
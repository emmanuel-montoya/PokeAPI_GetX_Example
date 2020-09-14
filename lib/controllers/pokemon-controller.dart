import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex_zipdev/controllers/login-controller.dart';
import 'package:pokedex_zipdev/services/poke-api-service.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokemonController extends GetxController {

  var logger = Logger();

  RxMap<String, Pokemon> _pokemons = Map<String, Pokemon>().obs;
  Map<String, Pokemon> get pokemons => _pokemons;
  set pokemons(Map<String, Pokemon> value) => this._pokemons;

  RxString _searchParam = "".obs;
  String get searchParam => _searchParam.value;
  set searchParam(String pokeUsername) => this._searchParam;

  bool _loading = true;
  bool get loading => _loading;
  set isLoading(bool isLoading) => this._loading;

  int _pokeIndex = 0;
  int get pokeIndex => _pokeIndex;
  set pokeIndex(int pokeIndex) => this._pokeIndex;

  @override
  void onInit() {
    super.onInit();
    logger.d("PokemonController Init");
  }

  @override
  void onReady(){
    super.onReady();
    logger.d("PokemonController Ready");
    getAvailablePokemons();
  }

  void setSearchParam(text) {
    _searchParam.value = text;
  }

  Future<Pokemon> getPokemonByNextIndex() async {
    _pokeIndex = pokemons.length + 1;
    logger.d("Getting Pokemon $_pokeIndex from Pokedex API");
    Pokemon pokemon;
    try {
      pokemon = await PokeAPIService().getPokemon(_pokeIndex);
      logger.d("Pokemon from Pokedex API ${pokemon.toString()}");
      _pokemons[pokemon.id.toString()] = pokemon;
    } catch (e) {
      Get.snackbar(
        "Error getting Pokemon By Index",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    update(['pokemon']);
    return pokemon;
  }

  Future<void> getAvailablePokemons() async {
    logger.d("Getting ${PokeConstants.retrieveLimit} Pokemons from Pokedex API");
    List<Pokemon> pokemons;

    try {
      pokemons = await PokeAPIService().getPokemons();
      pokemons.forEach((poke) {
        _pokemons[poke.id.toString()] = poke;
      });
      logger.d("Pokemons from Pokedex API ${pokemons.length}");
      logger.d("Pokemon from Pokedex API ${pokemons.toString()}");
      _loading = false;
    } catch (e) {
      logger.d(e.toString());
      Get.snackbar(
        "Error getting Pokemons",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    update(['pokemon']);
  }

}
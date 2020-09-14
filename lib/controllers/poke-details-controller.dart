import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex_zipdev/controllers/pokemon-controller.dart';

class PokeDetailsController extends GetxController {

  var logger = Logger();
  final pokemonController = Get.find<PokemonController>();

  Rx<Pokemon> _pokemon = Pokemon().obs;
  Pokemon get pokemon => _pokemon.value;
  set pokemon(Pokemon pokemon) => this._pokemon;

  RxString _types = "".obs;
  String get types =>_types.value;
  set types(String types) => this._types;

  RxString _encounterMinLevel = "".obs;
  String get encounterMinLevel =>_encounterMinLevel.value;
  set encounterMinLevel(String encounterMinLevel) => this._encounterMinLevel;

  RxString _encounterMaxLevel = "".obs;
  String get encounterMaxLevel => _encounterMaxLevel.value;
  set encounterMaxLevel(String encounterMaxLevel) => this._encounterMaxLevel;

  @override
  void onInit(){
    super.onInit();
    logger.d("Pokemon Details");
    _pokemon.value =  Get.arguments;
    getPokeDetails();
  }

  List<String> moveList = [];

  void getPokeDetails(){
    logger.d("Getting pokeDetails for ${_pokemon.value.name}");
    _pokemon.value.types.forEach((element) {
      logger.d("Getting pokemon types ${element.toString()}");
      Types types = Types(type: element.type);
      _types.value.isEmpty ? _types.value = _types.value + types.type.name
          : _types.value = _types.value + ", " + types.type.name;
    });

    _pokemon.value.moves.forEach((element) {
        logger.d("Getting pokemon moves ${element.toString()}");
      Moves moves = Moves(move: element.move);
      moveList.add(moves.move.name);
    });
    update(['details']);
  }

}
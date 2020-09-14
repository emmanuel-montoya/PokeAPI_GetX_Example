import 'package:logger/logger.dart';
import 'package:pokedex_zipdev/models/pokeCredentials.dart';
import 'package:pokedex_zipdev/models/pokeUser.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokeLoginService {

  var logger = Logger();

  Future<PokeUser> getUserWithcredentials(PokeCredentials pokeCredentials){
    logger.d("PokeUser with ${pokeCredentials.pokeUsername}"
        " ${pokeCredentials.pokePassword}");

    try {
      if(pokeCredentials.pokePassword == PokeConstants.passwordDummy) {
        return Future.delayed(
          Duration(seconds: 2),
              () => PokeUser.createLoggInExample(pokeCredentials.pokeUsername),
        );
      }
    } catch (e) {
      logger.d(e.toString());
    }

    return null;
  }

}
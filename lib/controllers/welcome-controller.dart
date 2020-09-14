import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_zipdev/models/pokeUser.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

class WelcomeController extends GetxController {

  var logger = Logger();

  Rx<PokeUser> _pokeUser = PokeUser().obs;
  PokeUser get pokeUser => _pokeUser.value;
  set pokeUser(PokeUser pokeUser) => this._pokeUser;

  @override
  void onInit(){
    super.onInit();
    logger.d("Starting Welcome Page");
    _pokeUser.value = Get.arguments;
    logger.d("Welcome ${_pokeUser.value.username}");
    Future.delayed(
      Duration(seconds: 3),
          () => Get.offAndToNamed(PokeRouteConstants.HOME)
    );
  }
}
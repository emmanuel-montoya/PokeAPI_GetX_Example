import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_zipdev/models/pokeCredentials.dart';
import 'package:pokedex_zipdev/models/pokeUser.dart';
import 'package:pokedex_zipdev/services/poke-login-service.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

class LoginController extends GetxController {

  var logger = Logger();
  bool useDummyPassword = false;
  bool skipValidation = false;

  RxString _pokeUsername = "".obs;
  String get pokeUsername => _pokeUsername.value;
  set pokeUsername(String pokeUsername) => this._pokeUsername;

  RxString _pokePassword = "".obs;
  String get pokePassword => _pokePassword.value;
  set pokePassword(String pokeUserName) => this._pokePassword;

  Rx<PokeUser> _pokeUser = PokeUser().obs;
  PokeUser get pokeUser => _pokeUser.value;
  set pokeUser(PokeUser pokeUser) => this._pokeUser;

  RxBool _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;
  set isLoggedIn(bool isLoggedIn) => this._isLoggedIn;

  RxBool _wrongCredentials = false.obs;
  bool get wrongCredentials => _wrongCredentials.value;
  set wrongCredentials(bool wrongCredentials) => this._wrongCredentials;

  @override
  void onInit() {
    super.onInit();
    logger.d("LoginController Init");
    ever(_isLoggedIn, handleAuthChanged);
  }

  Future<void> handleAuthChanged(isLoggedIn) async {
    logger.d(isLoggedIn.toString());
    try {
      if (!_isLoggedIn.value) {
        Get.offAllNamed(PokeRouteConstants.LOGIN);
      } else {
        if (_pokeUser.isNull) {
          logger.d("PokeUser with credentials not exists!!");
          //TODO Create PokeUser -> Start pokeUser builder process
        } else {
          logger.d("PokeUser with credentials exists!!");
          //TODO Retrieve additional information
        }

        logger.d("Going to welcome and home!!");
        Get.offAllNamed(PokeRouteConstants.WELCOME, arguments: _pokeUser.value);
      }
    } catch (e) {
      logger.d(e.toString());
      Get.snackbar(
        "Error handling auth",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loggInWithCredentials() async {
    logger.d("Start loggInWith Credentials");
    if (skipValidation || minimumValidation(_pokeUsername.value, _pokePassword.value)) {
      PokeCredentials pokeCredentials = PokeCredentials(
          pokeUsername: _pokeUsername.value,
          pokePassword: _pokePassword.value);

      if (useDummyPassword) {
        logger.d("Using dummyPassword");
        pokeCredentials.pokePassword = PokeConstants.passwordDummy;
      }

      logger.d(pokeCredentials.toString());
      PokeUser pokeUser = await PokeLoginService().getUserWithcredentials(
          pokeCredentials);

      if (!pokeUser.isNull) {
        _pokeUser.value = pokeUser;
        _isLoggedIn.value = true;
      } else {
        _wrongCredentials.value = true;
        logger.d("Invalid Credentials");
        Get.back();
      }
    } else {
      logger.d("Validate values");
    }

    logger.d("Exit ${pokeUser.toString()}");
    logger.d("WrongCredentials $_wrongCredentials");
    update(['login']);
  }
  void setPokeUserParam(text) {
    _pokeUsername.value = text;
  }

  void setPokePasswordParam(text) {
    _pokePassword.value = text;
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn.value = isLoggedIn;
    logger.d("login status changed to $isLoggedIn");
  }

  bool minimumValidation(String pokeUsername, String pokePassword){
    return pokeUsername.isEmpty ? false : pokePassword.isEmpty ? false : true;
  }
}
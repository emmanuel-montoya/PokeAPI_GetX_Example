import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

class OnBoardController extends GetxController {

  var logger = Logger();

  @override
  void onInit(){
    super.onInit();
    logger.d("Starting Onboard Page");
    Future.delayed(
      Duration(seconds: 2),
          () => Get.offAndToNamed(PokeRouteConstants.ROOT)
    );
  }
}
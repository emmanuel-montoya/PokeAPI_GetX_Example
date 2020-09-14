import 'package:get/get.dart';
import 'package:pokedex_zipdev/routes/pages/login-page.dart';
import 'package:pokedex_zipdev/routes/pages/onboard-page.dart';
import 'package:pokedex_zipdev/routes/pages/poke-details-page.dart';
import 'package:pokedex_zipdev/routes/pages/poke-home-page.dart';
import 'package:pokedex_zipdev/routes/pages/poke-search-page.dart';
import 'package:pokedex_zipdev/routes/pages/welcome-page.dart';
import 'package:pokedex_zipdev/routes/root.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: PokeRouteConstants.ONBOARD,
      page: () => OnboardPage(),
    ),
    GetPage(
      name: PokeRouteConstants.WELCOME,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: PokeRouteConstants.ROOT,
      page: () => Root(),
    ),
    GetPage(
      name: PokeRouteConstants.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: PokeRouteConstants.HOME,
      page: () => PokeHomePage(),
    ),
    GetPage(
      name: PokeRouteConstants.POKE_SEARCH,
      page: () => PokeSearchPage(),
    ),
    GetPage(
      name: PokeRouteConstants.POKE_DETAILS,
      page: () => PokeDetailsPage(),
    ),
  ];
}
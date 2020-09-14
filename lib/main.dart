import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/login-controller.dart';
import 'package:pokedex_zipdev/routes/app_routes.dart';
import 'package:pokedex_zipdev/routes/root.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      home: Root(),
      theme: ThemeData.dark(),
      initialRoute: PokeRouteConstants.ONBOARD,
      getPages: AppRoutes.routes,
    );
  }
}

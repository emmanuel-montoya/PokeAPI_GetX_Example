import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/login-controller.dart';
import 'package:pokedex_zipdev/routes/pages/login-page.dart';
import 'package:pokedex_zipdev/routes/pages/poke-home-page.dart';


class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        if (_.isLoggedIn) {
          return PokeHomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
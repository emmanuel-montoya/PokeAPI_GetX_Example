import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/onboard-controller.dart';
import 'package:pokedex_zipdev/routes/widgets/headerintro.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class OnboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardController>(
        init: OnBoardController(),
        builder: (_) => Scaffold(
        body: Center(child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            new HeaderIntro(),
            SizedBox(height: 100),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Image.network(PokeConstants.pokeApiImgUrl),
              ]
            ),
          ],
        ),),
      )
    );
  }
}
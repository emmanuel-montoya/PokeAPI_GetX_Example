import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/welcome-controller.dart';
import 'package:pokedex_zipdev/routes/widgets/headerintro.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
        init: WelcomeController(),
        builder: (_) => Scaffold(
        body: Center(child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            new HeaderIntro(),
            SizedBox(height: 100),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Image.network(PokeConstants.pokeApiImgUrl),
              SizedBox(height: 50),
              Text("Welcome ${_.pokeUser.username}", style: TextStyle(fontSize: PokeConstants.titleFontSize, color: Colors.yellow),),
              ]
            ),
          ],
        ),),
      )
    );
  }
}
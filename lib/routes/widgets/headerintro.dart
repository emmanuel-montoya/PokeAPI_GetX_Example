import 'package:flutter/material.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class HeaderIntro extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
      new Text(PokeConstants.pokedexTitle,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 90.0,
        ),
      ),
      new Text(PokeConstants.welcomeSubtitle,
        style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
      ),
      ),
    ]);
  }
}





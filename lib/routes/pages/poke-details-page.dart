import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/poke-details-controller.dart';
import 'package:pokedex_zipdev/routes/widgets/move-list.dart';
import 'package:pokedex_zipdev/routes/widgets/poke-appbar.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokeDetailsPage extends StatelessWidget {

  final textColor = Color.fromRGBO(250, 250, 250, 0.95);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontFamily: 'PT Sans', color: textColor);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetBuilder<PokeDetailsController>(
        id: "details",
        init: PokeDetailsController(),
        builder: (_) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: PokeAppBar(PokeConstants.pokeDetails),),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.05, 1, 1.95],
                colors: <Color>[
                  Color.fromRGBO(040, 040, 040, 1),
                  Color.fromRGBO(150, 0, 0, 1),
                  Color.fromRGBO(156, 156, 156, 1),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 300, child: Image.network(_.pokemon.sprites.frontDefault,)),
                  SizedBox(height: 5),
                  Text(_.pokemon.name.capitalizeFirst(_.pokemon.name),
                      style: textStyle.merge(TextStyle(fontSize: PokeConstants.titleFontSize))),
                  SizedBox(height: 10),
                  Flexible(child: Container(height: 2.0,color: Colors.white54,),),
                  SizedBox(height: 5),
                  Text("Types: ${_.types}",
                      style: textStyle.merge(TextStyle(fontSize:  PokeConstants.textFontSize, color: Colors.white54))),
                  SizedBox(height: 5),
                  Text("Weight: ${_.pokemon.weight.toString()} - Heigth: ${_.pokemon.height.toString()}",
                      style: textStyle.merge(TextStyle(fontSize:  PokeConstants.textFontSize, color: Colors.white54))),
                  SizedBox(height: 5),
                  Flexible(child: Container(height: 2.0,color: Colors.white54,),),
                  SizedBox(height: 5),
                  Text(PokeConstants.encounters,
                      style: textStyle.merge(TextStyle(fontSize: PokeConstants.subtitleFontSize))),
                  SizedBox(height: 5),
                  Flexible(child: Container(height: 2.0,color: Colors.white54,),),
                  SizedBox(height: 5),
                  Text("Location Areas: ${PokeConstants.underConstruction}",
                      style: textStyle.merge(TextStyle(fontSize:  PokeConstants.textFontSize, color: Colors.white54))),
                  SizedBox(height: 5),
                  Text("Min/Max Level: ${PokeConstants.underConstruction}",
                      style: textStyle.merge(TextStyle(fontSize: PokeConstants.textFontSize, color: Colors.white54))),
                  SizedBox(height: 5),
                  Flexible(child: Container(height: 2.0,color: Colors.white54,),),
                  Text("Moves", style: textStyle.merge(TextStyle(fontSize: PokeConstants.subtitleFontSize))),
                  SizedBox(height: 5),
                  Flexible(child: Container(height: 2.0,color: Colors.white54,),
                  ),
                  Container(height: 200, child: MoveList(),),
                ],
                ),
              ),
            ),
          ),
    );
  }
}
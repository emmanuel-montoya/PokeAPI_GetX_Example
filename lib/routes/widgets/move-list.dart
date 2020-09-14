import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/poke-details-controller.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';
import 'package:pokedex_zipdev/utils/pokeUtilities.dart';

class MoveList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokeDetailsController>(
        id: 'pokemon',
        init:PokeDetailsController(),
        builder: (_) => ListView.builder(
            itemBuilder: (context, index) {
                String pokeMove = _.moveList.elementAt(index);
                return Container(
                        child: ListTile(
                        title: Center(child: Column(
                          children: <Widget>[
                            Text(pokeMove.capitalizeFirst(pokeMove))]
                          ),
                        ),
                        onTap: () => {
                          PokeUtilities.showAlert(context, PokeConstants.pokeDetails, PokeConstants.underConstruction)
                        },
                      ),
                   );
                },
            itemCount: _.moveList.length,
          ),
      );
  }
}
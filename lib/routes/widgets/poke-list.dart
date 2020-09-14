import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokedex_zipdev/controllers/pokemon-controller.dart';
import 'package:pokedex_zipdev/utils/poke-route-constants.dart';

class PokeList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonController>(
        id: 'pokemon',
        init:PokemonController(),
        builder: (_) => Obx(() =>
            ListView.builder(
            itemBuilder: (context, index) {
              if(_.loading){
                return LinearProgressIndicator();
              } else {
                String pokeKey = _.pokemons.keys.elementAt(index);
                Pokemon pokemon = _.pokemons[pokeKey];
                return GestureDetector(
                      child: Container(
                        width: 400.0,
                        child: ListTile(
                        title: Center(child: Column(
                          children: <Widget>[
                            Image.network(pokemon.sprites.frontDefault),
                            Text(pokemon.name.capitalizeFirst(pokemon.name))]
                        ),),
                        onTap: () {
                          Get.toNamed(PokeRouteConstants.POKE_DETAILS, arguments: pokemon);
                        },
                      ),
                   ),
                );
              }
            },
            itemCount: _.pokemons.values.length,
          ),
        ),
    );
  }
}
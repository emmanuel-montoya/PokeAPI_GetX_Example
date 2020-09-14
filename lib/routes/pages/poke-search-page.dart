import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/pokemon-controller.dart';
import 'package:pokedex_zipdev/routes/widgets/poke-appbar.dart';
import 'package:pokedex_zipdev/routes/widgets/poke-list.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokeSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonController>(
        init: PokemonController(),
        builder: (_) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: PokeAppBar(PokeConstants.pokemonSearch),),
          body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: PokeConstants.search,
                          hintText: PokeConstants.searchHint,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0))
                          ),
                      ),
                      onChanged: (text) {
                        _.setSearchParam(text);
                        //TODO Retrieve information with Stream.
                      },
                    ),
                  ),
                    Expanded(
                      child: PokeList()
                    )
                ],
              ),
            ),
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/pokemon-controller.dart';
import 'package:pokedex_zipdev/routes/pages/poke-search-page.dart';
import 'package:pokedex_zipdev/routes/widgets/poke-appbar.dart';
import 'package:pokedex_zipdev/routes/widgets/poke-list.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';

class PokeHomePage extends StatelessWidget {

  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonController>(
        id: "pokemon",
        init: PokemonController(),
        builder: (_) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: PokeAppBar(PokeConstants.pokedexTitle),),
          body: Container(
            height: 800,
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: editingController,
                      decoration: InputDecoration(
                        labelText: PokeConstants.search,
                        hintText: PokeConstants.searchHint,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0))
                        ),
                      ),
                      onTap: (){
                        Get.to(PokeSearchPage());
                      },
                    ),
                  ),
                  Expanded(
                    child: PokeList(),
                  ),
                ]
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.navigate_next_sharp),
            onPressed: ()=>{
              _.getPokemonByNextIndex()
            },
          ),
        )
    );
  }
}
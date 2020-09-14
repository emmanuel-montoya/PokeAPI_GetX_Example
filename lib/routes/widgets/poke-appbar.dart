import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/login-controller.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';
import 'package:pokedex_zipdev/utils/pokeUtilities.dart';

class PokeAppBar extends StatelessWidget {

  final String title;

  PokeAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new TextButton(
          child: new Text(title, style: TextStyle(color: Colors.yellow, fontSize: 15,),),
          onPressed:() => {
            PokeUtilities.showAlert(context, PokeConstants.pokedexTitle, PokeConstants.appInfo),
          }
      ),
      backgroundColor: Color(Colors.yellow.shade50.red),
      actions: <Widget>[
        new Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return PokeConstants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
        ),
      ],
    );
  }

  void choiceAction(String choice){
    if(choice == PokeConstants.logout){
      Get.find<LoginController>().setIsLoggedIn(false);
    } else if(choice == PokeConstants.changetheme){
      if (Get.isDarkMode) {
        Get.changeTheme(ThemeData.light());
      } else {
        Get.changeTheme(ThemeData.dark());
      }
    }else if(choice == PokeConstants.about){
      //TODO
    }
  }
}

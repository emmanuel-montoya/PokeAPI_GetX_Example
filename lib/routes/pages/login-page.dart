import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_zipdev/controllers/login-controller.dart';
import 'package:pokedex_zipdev/routes/widgets/headerintro.dart';
import 'package:pokedex_zipdev/utils/poke-constants.dart';
import 'package:pokedex_zipdev/utils/poke_txt_eng.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: "login",
      init: LoginController(),
      builder: (_) => Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Container(
          height: 1000,
          width: 1000,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white12,
              Colors.white,
            ], begin: Alignment.topCenter, end: FractionalOffset(5, 5)),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150,),
                new HeaderIntro(),
                SizedBox(height: 150,),
                FlatButton(
                  child: Container(
                    child: Row(
                    children: [
                      Icon(Icons.login, color: Colors.yellow, size: 100),
                      Text(PokeTxtEng.logInWithUsername, style: TextStyle(fontSize: PokeConstants.subtitleFontSize, color: Colors.yellow),),
                    ]),),
                    onPressed: () => Alert(
                      context: context,
                      title: PokeConstants.welcomeToPokedex,
                      content: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (text) {
                          _.setPokeUserParam(text);
                          },
                          decoration: InputDecoration(
                          labelText: PokeConstants.pokeUsername,
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                          _.setPokePasswordParam(text);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                          labelText: PokeConstants.password,
                          hintText:PokeConstants.passwordDummy,
                          ),
                        ),
                      ],),
                      buttons: [
                        DialogButton(
                          onPressed: () => {
                          _.loggInWithCredentials()
                          },
                          child: Text(
                            PokeConstants.login,
                            style: TextStyle(color: Colors.black, fontSize: PokeConstants.subtitleFontSize),
                          ),
                        ),
                      ]
                    ).show()
                ),
                if(_.wrongCredentials) Text(PokeConstants.wrongCredentials, style: TextStyle(fontSize: PokeConstants.textFontSize, color: Colors.yellow),)
              ],
            ),),
          ),
        ),
    );
  }
}
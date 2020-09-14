import 'package:get/get.dart';

class PokeCredentials {

  String pokeUsername;
  String pokePassword;

  PokeCredentials({this.pokeUsername, this.pokePassword});

  @override
  String toString() {
    return 'PokeCredentials{pokeUsername: $pokeUsername, pokePassword: $pokePassword}';
  }

  Map<String, dynamic> toJSON() {
    GetConfig.log("PokeUser toJSON");
    return <String, dynamic>{
      'pokeUsername': pokeUsername,
      'pokePassword': pokePassword,
    };
  }
}
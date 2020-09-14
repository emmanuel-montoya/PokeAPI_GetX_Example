import 'package:get/get.dart';

class PokeUser {

  int id;
  String username;
  String firstName;
  String lastName;
  String dateOfBirth;
  String homeTown;
  String email;
  String password;
  String userImgUrl;

  PokeUser({this.id, this.username, this.firstName, this.lastName,
      this.dateOfBirth, this.homeTown, this.password, this.email,
      this.userImgUrl});

  @override
  String toString() {
    return 'PokeUser{id: $id, pokeUsername: $username, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, homeTown: $homeTown, password: $password, email: $email, userImgUrl: $userImgUrl}';
  }

  Map<String, dynamic> toJSON() {
    GetConfig.log("PokeUser toJSON");
    return <String, dynamic>{
      'id': id,
      'pokeUsername': username,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'homeTown': homeTown,
      'email': email,
      'password': password,
      'userImgUrl': userImgUrl
    };
  }

  PokeUser.createLoggInExample(pokeUsername){
    GetConfig.log("Creating LoggInExample");
    id = 01123581321345589144;
    username = pokeUsername;
    firstName = "somePokeUserFirstName";
    lastName = "somePokeUserLastName";
    dateOfBirth = "2/14/1992";
    homeTown = homeTown;
    email = "someemail@somedomain.com";
    password = "pokePassword1!";
    userImgUrl = "https://content.fortune.com/wp-content/uploads/2016/07/gettyimages-546978942.jpg?resize=750,500";
  }
}